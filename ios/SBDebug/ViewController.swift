//
//  ViewController.swift
//  SBDebug
//
//  Created by Mathieu Vignau on 5/5/18.
//  Copyright © 2018 Game 7. All rights reserved.
//

import UIKit
import SystemConfiguration
import NetworkExtension
import Reachability
import SwiftyJSON
import NetUtils
import SwiftHash
import Starscream

class ViewController: UIViewController, WebSocketDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var teamPicker: UIPickerView!
    @IBOutlet weak var clockPicker: UIPickerView!
    @IBOutlet weak var wifiIndicator: UIActivityIndicatorView!
    
    let socket = WebSocket(url: URL(string: String(format: "ws://%@/rpc", Credentials.RPC_HOST))!)
    var socketAuth = JSON()
    let reachability = Reachability(hostname: Credentials.RPC_HOST)!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        
//        NEHotspotConfigurationManager.shared.apply(NEHotspotConfiguration(ssid: Credentials.RPC_SSID))
        
        wifiIndicator.startAnimating()
        wifiIndicator.hidesWhenStopped = true
        initPickers()
        
        socket.delegate = self
        
        
        reachability.whenReachable = { reachability in
            for itf in Interface.allInterfaces() {
                if itf.address?.range(of: Credentials.RPC_NETWORK)?.lowerBound != nil {
                    self.wifiIndicator.stopAnimating()
                    self.socket.connect()
                    return
                }
            }
            self.wifiIndicator.startAnimating()
        }
        reachability.whenUnreachable = { reachability in
            self.wifiIndicator.startAnimating()
        }
        
        try? reachability.startNotifier()
    }
    
    var callCount:UInt = 0
    var callQueue = [RPCCall]()
    
    func rpcCall(method:String, data:JSON?=nil, response:((JSON?)->Void)?=nil) {
        
        callCount += 1
        
        let id = callCount
        let call = RPCCall(callback: response, id: id, method: method, args: data)
        callQueue.append(call)
 
        var json:JSON = ["id":id, "method":method, "src":"app", "auth":socketAuth]
        if let data = data {
            json["args"] = data
        }
        
        try? socket.write(data: json.rawData())
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        let result = JSON(parseJSON: text)
        let id = result["id"].uIntValue
        if let index = callQueue.index(where: {$0.id == id}) {
            let call = callQueue.remove(at: index)
            if let err = result["error"]["message"].string {
                let errmsg = JSON(parseJSON: err)
                if errmsg["auth_type"].string == "digest", let nonce = errmsg["nonce"].number,
                    let nc = errmsg["nc"].number, let realm = errmsg["realm"].string {
                    socketAuth = generateDigestResponse(nonce: nonce, nc: nc, realm: realm)
                    rpcCall(method: call.method, data: call.args, response: call.callback)
                } else {
                    print(err)
                }
            } else if let callback = call.callback {
                callback(result["result"])
            }
        }
        
    }
    
    func generateDigestResponse(nonce:NSNumber, nc:NSNumber, realm:String) -> JSON {
        let ha1 = MD5(String(format: "%@:%@:%@", Credentials.RPC_USER, realm, Credentials.RPC_PASSWORD)).lowercased()
        let ha2 = MD5("dummy_method:dummy_uri").lowercased()
        let cnonce = round(NSDate().timeIntervalSince1970)
        let response = MD5(String(format: "%@:%@:%@:%.0f:auth:%@", ha1, nonce.stringValue, nc.stringValue, cnonce, ha2)).lowercased()
        return ["realm":realm, "username":Credentials.RPC_USER, "nonce":nonce, "cnonce":cnonce, "response":response]
    }
    
    @IBAction func onClear(_ sender: Any) {
        rpcCall(method: "SB.Clear")
    }
    
    struct RPCCall {
        let callback:((JSON?)->Void)?
        let id:UInt
        let method:String
        let args:JSON?
    }
    
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocketDidConnect")
        rpcCall(method: "SB.SetText", data: ["text":teamDb[0][teamPicker.selectedRow(inComponent: 0)]+teamDb[1][teamPicker.selectedRow(inComponent: 1)], "display":0])
        rpcCall(method: "SB.SetText", data: ["text":teamDb[0][teamPicker.selectedRow(inComponent: 2)]+teamDb[1][teamPicker.selectedRow(inComponent: 3)], "display":1])
        refreshTime()
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData")
    }
    
    // -----
    
    var clockDb:[[(String, String)]] = [[], [], []]
    var teamDb:[[String]] = [[], []]
    
    func initPickers() {
        for i in 0...12 {
            let s = String(format: "%02d", i)
            clockDb[0].append((s, s))
        }
        for i in 0...59 {
            let s = String(format: "%02d", i)
            clockDb[1].append((s, s))
        }
        clockDb[2] = [("1st", "1"), ("2nd", "2"), ("3rd", "3"), ("4th", "4"), ("OT", "/")]
        
        teamDb[0] = ["ATL", "BOS", "BKN", "CHA", "CHI", "CLE", "DAL", "DEN", "DET", "GSW", "HOU", "IND", "LAC", "LAL", "MEM", "MIA", "MIL", "MIN", "NOP", "NYK", "OKC", "ORL", "PHI", "PHX", "POR", "SAC", "SAS", "TOR", "UTA", "WAS"]
        for i in 0...200 {
            let s = String(format: "%01d", i).leftPadding(toLength: 3, withPad: " ")
            teamDb[1].append(s)
        }
        
        teamPicker.delegate = self
        teamPicker.dataSource = self
        clockPicker.delegate = self
        clockPicker.dataSource = self
        
        clockPicker.selectRow(clockDb[0].count-1, inComponent: 0, animated: false)
        teamPicker.selectRow(1, inComponent: 2, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerView == clockPicker ? clockDb.count : teamDb.count*2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == clockPicker ? clockDb[component].count : teamDb[component%2].count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == clockPicker {
            refreshTime()
        } else {
            let display = floor(Double(component)/2)
            let offset = (component%2)*3
            rpcCall(method: "SB.SetText", data: ["text":teamDb[component%2][row], "display":display, "offset":offset])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let l:UILabel
        if let view = view as? UILabel {
            l = view
        } else {
            l = UILabel()
            l.font = UIFont(name: "Verdana", size: 12)
            l.textAlignment = .center
            l.textColor = UIColor.white
        }
        if pickerView == clockPicker {
            l.text = clockDb[component][row].0
        } else {
            l.text = teamDb[component%2][row]
        }
        
        return l
    }
    
    func refreshTime() {
        let s =
            clockDb[0][clockPicker.selectedRow(inComponent: 0)].1 +
            clockDb[1][clockPicker.selectedRow(inComponent: 1)].1 +
            clockDb[2][clockPicker.selectedRow(inComponent: 2)].1
        rpcCall(method: "SB.SetClock", data: ["text":s])
    }
}

extension String {
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let newLength = self.count
        if newLength < toLength {
            return String(repeatElement(character, count: toLength - newLength)) + self
        } else {
            return self
        }
    }
}
