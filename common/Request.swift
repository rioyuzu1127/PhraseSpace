//
//  Request.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/19.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit
import Foundation

class Request {
    
    let HTTP_OK = 200
    let HTTP_CREATED = 201
    let HTTP_MOVE_TMP = 302
    
    let TIME_OUT_ERRORCODE = -1001
    
    fileprivate var method:String?
    fileprivate var url:String?
    fileprivate var param:[String: Any]?
    fileprivate var type:CommunicationType
    
    var accesstype:CommunicationType {
        get{return self.type}
        set(Value){self.type = Value}
    }
    
    // header
    fileprivate var header = [String: String]()
    var accessheader:[String: String]{
        get{return self.header}
        set(Value){self.header = Value}
    }
    
    // レスポンス
    fileprivate var responseData:String?
    var accessresponseData:String?{
        get{return self.responseData}
        set(Value){self.responseData = Value}
    }
    
    fileprivate var retryCount = 3
    var accessretryCount:Int{
        get{return self.retryCount}
        set(Value){self.retryCount = Value}
    }
    
    fileprivate var retryInterval = (1.0 * 5)
    var accessretryInterval:Double{
        get{return self.retryInterval}
        set(Value){self.retryInterval = Value}
    }
    
    fileprivate var timeOutFlg = 0
    var accesstimeOutFlg:Int{
        get{return self.timeOutFlg}
        set(Value){self.timeOutFlg = Value}
    }
    
    fileprivate var responseCode = 0
    var accessresponseCode:Int{
        get{return self.responseCode}
        set(Value){self.responseCode = Value}
    }
    
    fileprivate var ConnectTimeOut = (10.0 * 2)
    var accessConnectionTimeOut:Double{
        get{return self.ConnectTimeOut}
        set(Value){self.ConnectTimeOut = Value}
    }
    
    var ReadTimeOut = (10.0 * 2)
    var accessReadTimeOut:Double{
        get{return self.ReadTimeOut}
        set(Value){self.ReadTimeOut = Value}
    }
    
    fileprivate var connectFlg:Bool
    var accessconnectFlg:Bool {
        get{return self.connectFlg}
        set(Value){self.connectFlg = Value}
    }
    
    init(_ type:CommunicationType, _ method:String, _ url:String, _ param:[String: Any]?){
        self.method = method
        self.url = url
        self.param = param
        self.type = type
        self.connectFlg = false
    }
    
    /**
     * API呼び出し時に設定するヘッダ情報を生成する
     */
    func HttpHeader() -> [String: String] {
        // メモリーで保持する値を参照するためAppDelegateのインスタンスを取得
        //let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        var header = [String: String]()
        //header[Const.HEADER_KEY_CLIENT_ID] = Const.CLIENT_ID
        return header
    }
    
    func sendRequest() -> Bool {
        if isConected() {
            connectFlg = true
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = ConnectTimeOut
            sessionConfig.timeoutIntervalForResource = ReadTimeOut
            let session = URLSession(configuration: sessionConfig)
            
            // リクエストヘッダーを設定
            let header = HttpHeader()
            
            for retryNum in 0...Const.RETRY_COUNT {
                let requestUrl = URL(string: self.url!)
                
                var request = URLRequest(url: requestUrl!)
                
                request.httpMethod = self.method!
                
                if self.method == "POST" {
                    request.setValue(Const.CONTENT_TYPE, forHTTPHeaderField: Const.HEADER_KEY_CONTENT_TYPE)
                }
                
                if header.count != 0 {
                    for (key, val) in header {
                        request.setValue(val, forHTTPHeaderField: key)
                    }
                }
                
                // パラメータを設定
                if param != nil {
                    if self.method == "POST" {
                        do {
                            request.httpBody = try JSONSerialization.data(withJSONObject: param!, options: .prettyPrinted)
                        } catch {
                            return false
                        }
                    }
                }
                
                let semaphore = DispatchSemaphore(value: 0)
                
                var timeout = false
                var sendStatus = true
                
                let task = session.dataTask(with: request, completionHandler: {data, res, error in
                    if error != nil {
                        if error?._code == Const.TIME_OUT_ERRORCODE {
                            timeout = true
                        } else {
                            if let httpURLResponse = res as? HTTPURLResponse {
                                self.responseCode = httpURLResponse.statusCode
                            }
                            print("Request.sendRequest:HttpStatus(エラー):\(self.responseCode)")
                        }
                    } else {
                        if let httpURLResponse = res as? HTTPURLResponse {
                            self.responseCode = httpURLResponse.statusCode
                        }
                        
                        self.responseData = String(data: data!, encoding: String.Encoding.utf8)
                        sendStatus = true
                        
                        // 更新系など正常終了してもデータがからのものは、後続の処理でエラーとならないように空のJSONを設定しておく
                        if (self.responseCode == self.HTTP_OK || self.responseCode == self.HTTP_CREATED) && self.responseData == "" {
                            self.responseData = "{}"
                        }
                    }
                    semaphore.signal()})
                
                task.resume()
                
                _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                
                if sendStatus {
                    if self.responseCode != HTTP_OK
                        && self.responseCode != HTTP_CREATED
                        && self.responseCode != HTTP_MOVE_TMP {
                        return false
                    }
                    break
                } else if !timeout {
                    return false
                } else if retryNum == Const.RETRY_COUNT {
                    self.timeOutFlg = 1
                    return false
                } else {
                    Thread.sleep(forTimeInterval: Const.RETRY_INTERVAL)
                }
            }
            return true
        } else {
            self.connectFlg = false
        }
        return false
    }
    
    func isConected() -> Bool{
        return true
    }
}

