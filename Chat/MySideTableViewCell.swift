//
//  MySideTableViewCell.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/21.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class MySideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var readLabel: UILabel!
    
    @IBOutlet weak var textViewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.textView.layer.cornerRadius = 15 // 角を丸める
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MySideTableViewCell {
    func updateCell(text: String, time: String, isRead: Bool) {
        self.textView?.text = text
        self.timeLabel?.text = time
        self.readLabel?.isHidden = !isRead
        
        let frame = CGSize(width: self.frame.width - 8, height: CGFloat.greatestFiniteMagnitude)
        var rect = self.textView.sizeThatFits(frame)
        if(rect.width<30){
            rect.width=30
        }
        textViewWidthConstraint.constant = rect.width//テキストが短くても最小のビューの幅を30とする
    }
}


