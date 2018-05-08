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

class ViewController: UIViewController, WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocketDidConnect")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData")
    }
    

    @IBOutlet weak var wifiIndicator: UIActivityIndicatorView!
    
    let socket = WebSocket(url: URL(string: String(format: "ws://%@/rpc", Credentials.RPC_HOST))!)
    var socketAuth = JSON()
    let reachability = Reachability(hostname: Credentials.RPC_HOST)!
    
    override func viewDidLoad() {
        
//        NEHotspotConfigurationManager.shared.apply(NEHotspotConfiguration(ssid: Credentials.RPC_SSID))
        
        wifiIndicator.startAnimating()
        wifiIndicator.hidesWhenStopped = true
        
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
 

    @IBAction func onAction(_ sender: Any) {
        self.rpcCall(method: "SB.Next", data: ["screen":UInt8(Double(arc4random())/Double(UInt32.max)*18)]) { response in
            print(response)
        }
    }
    
    @IBAction func onDisconnect(_ sender: Any) {
        self.rpcCall(method: "Wifi.Disconnect")
    }
    
    struct RPCCall {
        let callback:((JSON?)->Void)?
        let id:UInt
        let method:String
        let args:JSON?
    }
    
}

