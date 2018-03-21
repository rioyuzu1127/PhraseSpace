//
//  PersonTableViewCell.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/21.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var personImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 角丸にする
        personImage.layer.cornerRadius = personImage.frame.size.width * 0.1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
