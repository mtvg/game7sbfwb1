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
import SwiftHTTP

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
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = true
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
    
    var mid:Int = 0
    
    func makeRequest() {
        
        HTTP.GET(String(format: "https://api.thescore.com/multisport/events?game_date.in=%@,%@", Date().startOfDay.toRFC3339(), Date().endOfDay.toRFC3339())) { response in
            if let err = response.error {
                print("error: \(err.localizedDescription)")
                return //also notify app of failure as needed
            }
            
            if let json = try? JSON.init(data: response.data) ,
                let wnba = json["wnba","events"].array {
                
                for event in wnba {
                    if event["event_status"].string == "in_progress",
                    let va = event["away_team","abbreviation"].string?.uppercased(), let ha = event["home_team","abbreviation"].string?.uppercased(),
                    let cl = event["box_score","progress","clock"].string,
                    let p = event["box_score","progress","segment"].int,
                    let v = event["box_score","score","away","score"].int, let h = event["box_score","score","home","score"].int {
                        let cla = cl.components(separatedBy: ":")
                        DispatchQueue.main.sync {
                            if self.teamDb[0][self.teamPicker.selectedRow(inComponent: 0)] != va {
                                if let i = self.teamDb[0].index(of: va) {
                                    self.teamPicker.selectRow(i, inComponent: 0, animated: true)
                                } else {
                                    self.teamDb[0].append(va)
                                    self.teamPicker.reloadComponent(0)
                                    self.teamPicker.selectRow(self.teamDb[0].count-1, inComponent: 0, animated: true)
                                }
                                self.rpcCall(method: "SB.SetText", data: ["text":va, "display":0])
                            }
                            if self.teamDb[0][self.teamPicker.selectedRow(inComponent: 2)] != ha {
                                if let i = self.teamDb[0].index(of: ha) {
                                    self.teamPicker.selectRow(i, inComponent: 2, animated: true)
                                } else {
                                    self.teamDb[0].append(ha)
                                    self.teamPicker.reloadComponent(2)
                                    self.teamPicker.selectRow(self.teamDb[0].count-1, inComponent: 2, animated: true)
                                }
                                self.rpcCall(method: "SB.SetText", data: ["text":ha, "display":1])
                            }
                            
                            self.clockPicker.selectRow(p-1, inComponent: 2, animated: true)
                            self.clockPicker.selectRow(Int(cla[0])!, inComponent: 0, animated: true)
                            self.clockPicker.selectRow(Int(Float(cla[1])!), inComponent: 1, animated: true)
                            self.teamPicker.selectRow(v, inComponent: 1, animated: true)
                            self.teamPicker.selectRow(h, inComponent: 3, animated: true)
                            
                            self.refreshScoreTime()
                        }
                        break
                    }
                }
            }
        }
        
        /*
        HTTP.GET("http://data.nba.com/data/v2015/json/mobile_teams/nba/2017/scores/00_todays_scores.json") { response in
            if let err = response.error {
                print("error: \(err.localizedDescription)")
                return //also notify app of failure as needed
            }
            
            if let json = try? JSON.init(data: response.data),
                let mid = json["gs"]["mid"].int,
                mid != self.mid,
                let game = json["gs"]["g"][0].dictionary,
                let p = game["p"]?.int, let cl = game["cl"]?.string,
                let v = game["v"]?["s"].int, let h = game["h"]?["s"].int,
                let va = game["v"]?["ta"].string, let ha = game["h"]?["ta"].string {
                
                self.mid = mid
                let cla = cl.components(separatedBy: ":")
                
                
                
                DispatchQueue.main.sync {
                    if self.teamDb[0][self.teamPicker.selectedRow(inComponent: 0)] != va, let i = self.teamDb[0].index(of: va) {
                        self.teamPicker.selectRow(i, inComponent: 0, animated: true)
                        self.rpcCall(method: "SB.SetText", data: ["text":va, "display":0])
                    }
                    if self.teamDb[0][self.teamPicker.selectedRow(inComponent: 2)] != ha, let i = self.teamDb[0].index(of: ha) {
                        self.teamPicker.selectRow(i, inComponent: 2, animated: true)
                        self.rpcCall(method: "SB.SetText", data: ["text":ha, "display":1])
                    }
                    
                    self.clockPicker.selectRow(p-1, inComponent: 2, animated: true)
                    self.clockPicker.selectRow(Int(cla[0])!, inComponent: 0, animated: true)
                    self.clockPicker.selectRow(Int(Float(cla[1])!), inComponent: 1, animated: true)
                    self.teamPicker.selectRow(v, inComponent: 1, animated: true)
                    self.teamPicker.selectRow(h, inComponent: 3, animated: true)
                    
                    self.refreshScoreTime()
                }
            }
        }
         */
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
//        rpcCall(method: "SB.SetText", data: ["text":teamDb[0][teamPicker.selectedRow(inComponent: 0)]+teamDb[1][teamPicker.selectedRow(inComponent: 1)], "display":0])
//        rpcCall(method: "SB.SetText", data: ["text":teamDb[0][teamPicker.selectedRow(inComponent: 2)]+teamDb[1][teamPicker.selectedRow(inComponent: 3)], "display":1])
//        refreshTime()
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
    
    let game = [[0,11,10,2,0],[0,10,37,4,0],[0,9,59,4,3],[0,9,40,6,3],[0,9,27,6,5],[0,9,27,6,6],[0,9,17,7,6],[0,9,17,8,6],[0,9,3,8,8],[0,8,37,8,10],[0,8,25,10,10],[0,8,13,10,12],[0,7,42,13,12],[0,7,18,15,12],[0,6,42,15,15],[0,6,23,18,15],[0,6,4,18,17],[0,5,44,20,17],[0,5,28,20,19],[0,5,12,21,19],[0,4,46,21,21],[0,4,26,23,21],[0,4,26,24,21],[0,4,7,24,22],[0,4,7,24,23],[0,3,17,24,25],[0,3,4,26,25],[0,2,53,26,27],[0,2,43,27,27],[0,2,43,28,27],[0,1,27,28,29],[0,1,0,30,29],[1,11,41,32,29],[1,11,22,32,30],[1,11,22,32,31],[1,10,37,34,31],[1,10,13,36,31],[1,9,51,36,33],[1,8,59,38,33],[1,8,49,38,35],[1,8,25,40,35],[1,7,55,42,35],[1,7,22,44,35],[1,7,5,44,38],[1,6,28,44,40],[1,6,9,47,40],[1,5,54,49,40],[1,5,19,51,40],[1,5,1,51,43],[1,4,28,51,45],[1,2,18,51,48],[1,1,57,53,48],[1,1,50,53,50],[1,1,50,53,51],[1,1,23,53,53],[1,1,4,54,53],[1,1,4,55,53],[1,1,4,56,53],[1,0,0.5,56,56],[2,11,44,56,58],[2,10,57,56,60],[2,10,49,59,60],[2,10,36,59,62],[2,10,12,59,64],[2,9,2,59,66],[2,8,12,61,66],[2,7,11,61,68],[2,6,47,62,68],[2,6,47,63,68],[2,6,24,65,68],[2,5,27,68,68],[2,5,8,68,70],[2,4,32,70,70],[2,4,16,73,70],[2,4,3,73,73],[2,3,8,73,74],[2,3,8,73,75],[2,2,59,75,75],[2,2,39,75,77],[2,1,46,75,80],[2,1,15,75,82],[2,0,56.4,77,82],[2,0,46.7,77,84],[2,0,34.4,78,84],[3,10,51,80,84],[3,10,7,80,86],[3,9,48,82,86],[3,9,32,82,87],[3,9,32,82,88],[3,9,32,82,89],[3,9,21,85,89],[3,8,54,88,89],[3,8,23,88,91],[3,8,1,90,91],[3,7,31,92,91],[3,6,43,92,92],[3,6,42,92,94],[3,5,22,94,94],[3,5,6,94,97],[3,4,39,94,100],[3,3,37,96,100],[3,2,54,98,100],[3,2,35,98,102],[3,2,4,101,102],[3,0,50.8,103,102],[3,0,50.8,104,102],[3,0,36.4,104,103],[3,0,36.4,104,104],[3,0,32.1,106,104],[3,0,23.5,106,106],[3,0,23.5,106,107],[3,0,4.7,107,107],[4,4,6,107,108],[4,4,6,107,109],[4,3,45,107,112],[4,3,2,107,114],[4,2,14,107,116],[4,1,56,109,116],[4,1,36,109,119],[4,1,23,110,119],[4,1,23,111,119],[4,1,4,111,122],[4,0,27.7,114,122],[4,0,2.6,114,123],[4,0,2.6,114,124]]
    
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
    @IBOutlet weak var slider: UISlider!
    @IBAction func onSlider(_ slider: UISlider) {
        let event = game[Int(round(slider.value*Float(game.count-1)))]
        clockPicker.selectRow(Int(event[0]), inComponent: 2, animated: false)
        clockPicker.selectRow(Int(event[1]), inComponent: 0, animated: false)
        clockPicker.selectRow(Int(event[2]), inComponent: 1, animated: false)
        teamPicker.selectRow(Int(event[3]), inComponent: 1, animated: false)
        teamPicker.selectRow(Int(event[4]), inComponent: 3, animated: false)
    }
    @IBAction func onSliderDone(_ sender: Any) {
        refreshScoreTime()
    }
    @IBAction func onPrev(_ sender: Any) {
        var i = round(slider.value*Float(game.count-1))
        if i>0 {
            i -= 1
        }
        slider.setValue(i/Float(game.count-1), animated: true)
        onSlider(slider)
        refreshScoreTime()
    }
    @IBAction func onNext(_ sender: Any) {
        var i = round(slider.value*Float(game.count-1))
        if i<Float(game.count-1) {
            i += 1
        }
        slider.setValue(i/Float(game.count-1), animated: true)
        onSlider(slider)
        refreshScoreTime()
    }
    
    var timer:Timer?
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.makeRequest()
            }
        } else {
            timer?.invalidate()
        }
    }
    
    func refreshScoreTime() {
        /*let event = game[Int(round(slider.value*Float(game.count-1)))]
        let s:String
        if event[2] == round(event[2]) {*/
            let s =
                clockDb[0][clockPicker.selectedRow(inComponent: 0)].1 +
                clockDb[1][clockPicker.selectedRow(inComponent: 1)].1 +
                clockDb[2][clockPicker.selectedRow(inComponent: 2)].1
        /*} else {
            s =
                String(format: "%02d", Int(event[2]*10)).leftPadding(toLength: 4, withPad: " ") +
                clockDb[2][Int(event[0])].1 + "."
        }*/
        rpcCall(method: "SB.SetScoreClock", data: ["clock":s, "scoreA":teamDb[1][teamPicker.selectedRow(inComponent: 1)], "scoreB":teamDb[1][teamPicker.selectedRow(inComponent: 3)]])
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

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date! {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)
    }
    
    func toRFC3339() -> String {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return RFC3339DateFormatter.string(from: self)
    }
}
