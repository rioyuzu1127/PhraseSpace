//
//  Const.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/19.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import Foundation

// 定数クラス
class Const {
    
    // API基準URL（疎通確認用環境）
    static let BASE_URL = ""
    
    static let CONTENT_TYPE = "application/json; charset=UTF-8"
    // HTTPヘッダーキー（Content-Type）
    static let HEADER_KEY_CONTENT_TYPE = "Content-Type"
    
    static let TIME_OUT_ERRORCODE = -1001
    static let RETRY_COUNT = 3
    static let RETRY_INTERVAL = 3.0
    
    static let HTTP_STATUS_BAD_REQUEST = 400
    static let HTTP_STATUS_TIMEOUT = 401
    static let HTTP_STATUS_NOT_FOUND = 404
    static let HTTP_STATUS_REQUEST_TIMEOUT = 408
    static let HTTP_STATUS_SERVER_ERROR = 500
    static let HTTP_STATUS_MAINTENANCE = 503
    
}

