//
//  ApiClient.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/20.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import Foundation
import UIKit



class ApiClient {
    static func call(type:CommunicationType, param:[String:Any]?,
                     _ onSuccess:@escaping (Request?) -> Void,
                     _ onError:@escaping (Request?) -> Void) {
        switch type {
        case CommunicationType.get_Phrase:
            getPhrase(onSuccess, onError)
        case CommunicationType.update_Phrase:
            updatePhrase(param!, onSuccess, onError)
        case CommunicationType.get_Chat:
            getChat(onSuccess, onError)
        default:
            onError(nil)
        }
    }
    
    static func getPhrase(_ onSuccess: (Request) -> Void, _ onError: (Request) -> Void) {
        let url = "http://192.168.1.10:8080/data/phrase?id=1"
        var request = Request(CommunicationType.get_Phrase, "GET", url, nil)
        if request.sendRequest() {
            onSuccess(request)
        } else {
            onError(request)
        }
    }
    
    static func updatePhrase(_ param:[String:Any], _ onSuccess: (Request) -> Void, _ onError: (Request) -> Void) {
        let url = "http://192.168.1.10:8080/data/updatePhrase"
        var request = Request(CommunicationType.update_Phrase, "POST", url, param)
        if request.sendRequest() {
            onSuccess(request)
        } else {
            onError(request)
        }
    }
    
    static func getChat(_ onSuccess: (Request) -> Void, _ onError: (Request) -> Void) {
        let url = "http://192.168.1.10:8080/data/chat?myId=1&opponentId=2"
        var request = Request(CommunicationType.get_Chat, "GET", url, nil)
        if request.sendRequest() {
            onSuccess(request)
        } else {
            onError(request)
        }
    }
}
