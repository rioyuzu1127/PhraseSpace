//
//  DetailViewCell.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/02.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit



class DetailViewCell: UITableViewCell {
   
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var toEditPage: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
