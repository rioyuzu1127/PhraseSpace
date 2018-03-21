//
//  ChatRoomInputView.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/21.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class ChatRoomInputView: UIView {
    
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFromXib()
    }
    
    func setFromXib() {
        let nib = UINib.init(nibName: "ChatRoomInputView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)// Storyboardから読み込んだレイアウトでビューを重ねて表示
    }
}

