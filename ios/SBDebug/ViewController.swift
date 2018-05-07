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
import Starscream
import NetUtils
import SwiftHash

class ViewController: UIViewController, WebSocketDelegate {

    @IBOutlet weak var wifiIndicator: UIActivityIndicatorView!
    
    var credentials = URLCredential(user: Credentials.RPC_USER, password: Credentials.RPC_PASSWORD, persistence: .forSession)
    let protectionSpace = URLProtectionSpace(host: Credentials.RPC_HOST, port: 80, protocol: "http", realm: Credentials.RPC_DOMAIN, authenticationMethod: nil)
    let session = URLSession(configuration: .default)
    
    let socket = WebSocket(url: URL(string: "ws://192.168.7.1/rpc")!)
    
    let reachability = Reachability(hostname: Credentials.RPC_HOST)!
    override func viewDidLoad() {
        URLCredentialStorage.shared.setDefaultCredential(credentials, for: protectionSpace)
        
        let wifi = NEHotspotConfiguration(ssid: "Game 7 Scoreboard [1809A9]")
        wifi.joinOnce = true
        NEHotspotConfigurationManager.shared.apply(wifi)
        
        wifiIndicator.startAnimating()
        wifiIndicator.hidesWhenStopped = true
        
        socket.delegate = self
        
        
        reachability.whenReachable = { reachability in
            for itf in Interface.allInterfaces() {
                if itf.address?.range(of: "192.168.7.")?.lowerBound != nil {
                    self.wifiIndicator.stopAnimating()
                    print("Reachable")
                    self.socket.connect()
                    return
                }
            }
            self.wifiIndicator.startAnimating()
            print("Not reachable")
        }
        reachability.whenUnreachable = { reachability in
            self.wifiIndicator.startAnimating()
            print("Not reachable")
        }
        
        try? reachability.startNotifier()
    }
    
    func rpcCall(method:String, data:JSON?=nil, response:((JSON?)->Void)?=nil) {
        /*
        var request = URLRequest(url: URL(string: "http://"+Credentials.RPC_HOST+Credentials.RPC_URI+method)!)
        request.httpMethod = "POST"
        try? request.httpBody = data?.rawData()
        session.dataTask(with: request) { (data, res, err) in
            if let error = err {
                print(error)
                DispatchQueue.main.async {
                    response?(nil)
                }
            } else if let data = data {
                let result = JSON(data)
                DispatchQueue.main.async {
                    response?(result)
                }
            }
        }.resume()
 */
        var json:JSON = ["method":method, "src":"app", "auth":auth]
        if let data = data {
            json["args"] = data
        }
        try? socket.write(data: json.rawData())
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocketDidConnect")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect", error)
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        let result = JSON(parseJSON: text)
        if let err = result["error"]["message"].string {
            let errmsg = JSON(parseJSON: err)
            print(errmsg)
            if errmsg["auth_type"].string == "digest", let nonce = errmsg["nonce"].string, let nc = errmsg["nc"].string {
                let ha1 = MD5(Credentials.RPC_USER+":"+Credentials.RPC_DOMAIN+":"+Credentials.RPC_PASSWORD)
                let ha2 = MD5("GET:/rpc")
                self.auth = MD5(ha1+":"+nonce+":"+nc+":"+ha2)
                
            
                
            }
        }
        print(result)
    }
    
    var auth:String = ""

    @IBAction func onAction(_ sender: Any) {
        self.rpcCall(method: "SB.SetScore", data: ["screen":UInt8(Double(arc4random())/Double(UInt32.max)*18)]) { response in
            print(response)
        }
    }
    
    @IBAction func onDisconnect(_ sender: Any) {
        self.rpcCall(method: "Wifi.Disconnect")
    }
    
}

