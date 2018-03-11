//
//  Chat.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/10.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import Foundation

class ChatList {
    var chatList = Array<Chat>()
}

class Chat {
    /**
     * 連番
     */
    var chatId : Int64!
    /**
     * 自分
     */
    var myId : Int64!
    /**
     * トーク内容
     */
    var talkContents : String!
    /**
     * 相手
     */
    var opponentId : Int64!
}
