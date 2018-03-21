//
//  HeaderTableViewCell.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/22.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var phraseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
