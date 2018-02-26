//
//  Phrase.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/20.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import Foundation

class PhraseList {
    var phraseList = Array<Phrase>()
    /**
     * 検索結果件数
     */
    var count:Int64!
}

class Phrase {
    /**
     * フレーズID
     */
    var phraseId:Int64!
    
    /**
     * フレーズ
     */
    var phrase:String!
    
    /**
     * カテゴリー
     */
    var category:String!
    
    /**
     * userId
     */
    var userId:Int64!
    
    /**
     * 概要
     */
    var overView:String!
}
