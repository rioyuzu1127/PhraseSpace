//
//  PhraseDetailViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/14.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class PhraseDetailViewController : BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var naviView: UIView!
    @IBOutlet weak var tableView: UITableView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let phrase : String! = ""
    var row : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "DetailViewCell", bundle: nil), forCellReuseIdentifier: "DetailViewCell")
        self.tableView.estimatedRowHeight = 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func toEditPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PhraseEdit", bundle: nil)
        let editVC = storyboard.instantiateViewController(withIdentifier: "PhraseEditViewController") as! PhraseEditViewController
        editVC.row = self.row
        present(editVC, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! DetailViewCell
        let list = appDelegate.phraseList.phraseList[self.row!]
        if indexPath.row == 0 {
            cell.themeLabel.text = "フレーズ"
            cell.phraseLabel.text = list.phrase
        }
        else if indexPath.row == 1 {
            cell.themeLabel.text = "カテゴリー"
            cell.phraseLabel.text = list.category
        }
        else {
            cell.themeLabel.text = "意味・概要"
            cell.phraseLabel.text = list.overView
        }
        return cell
    }
    
}
