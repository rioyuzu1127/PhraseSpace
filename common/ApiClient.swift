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
        default:
            onError(nil)
        }
    }
    
    static func getPhrase(_ onSuccess: (Request) -> Void, _ onError: (Request) -> Void) {
        let url = "http://192.168.1.8:8080/data/phrase?id=1"
        var request = Request(CommunicationType.get_Phrase, "GET", url, nil)
        if request.sendRequest() {
            onSuccess(request)
        } else {
            onError(request)
        }
    }
}
