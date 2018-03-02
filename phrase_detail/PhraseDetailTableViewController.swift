//
//  PhraseDetailTableViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/01.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class PhraseDetailTableViewController : UITableViewController {
    
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailViewCell", bundle: nil), forCellReuseIdentifier: "DetailViewCell")
        tableView.estimatedRowHeight = 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! DetailViewCell
        if indexPath.row == 0 {
            cell.themeLabel.text = "フレーズ"
            cell.phraseLabel.text = PreferenceKey.Phrase.getValue() as? String
        }
        else if indexPath.row == 1 {
            cell.themeLabel.text = "カテゴリー"
            cell.phraseLabel.text = PreferenceKey.Category.getValue() as? String
        }
        else {
            cell.themeLabel.text = "意味・概要"
            cell.phraseLabel.text = PreferenceKey.OverView.getValue() as? String
        }
        return cell
    }
}
