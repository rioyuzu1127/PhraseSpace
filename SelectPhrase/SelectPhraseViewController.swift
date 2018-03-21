//
//  SelectPhraseViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/21.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class SelectPhraseViewController : BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PhraseTableCell", bundle: nil), forCellReuseIdentifier: "PhraseTableCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SelectPhraseViewController : UITableViewDelegate {
    
}

extension SelectPhraseViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.phraseList.phraseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let phrase = appDelegate.phraseList.phraseList[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PhraseTableCell", for: indexPath) as! PhraseTableCell
        if phrase.category == "挨拶" {
            cell.categoryLabel.text = "挨拶"
            cell.categoryImage.image = UIImage(named:"greenCircle.png")
        }
        else if phrase.category == "ビジネス" {
            cell.categoryLabel.text = "ビジネス"
            cell.categoryImage.image = UIImage(named:"purpleCircle.png")
        }
        else if phrase.category == "喜び" {
            cell.categoryLabel.text = "喜び"
            cell.categoryImage.image = UIImage(named:"orangeCircle.png")
        }
        else if phrase.category == "悲しみ" {
            cell.categoryLabel.text = "悲しみ"
            cell.categoryImage.image = UIImage(named:"blueCircle.png")
        }
        else if phrase.category == "怒り" {
            cell.categoryLabel.text = "怒り"
            cell.categoryImage.image = UIImage(named:"redCircle.png")
        }
        else if phrase.category == "その他" {
            cell.categoryLabel.text = "その他"
            cell.categoryImage.image = UIImage(named:"yellowCircle.png")
        }
        cell.phrase.text = phrase.phrase
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let phrase = appDelegate.phraseList.phraseList[indexPath.row].phrase
        let storyboard = UIStoryboard(name: "ChatRoom", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ChatRoomViewController") as! ChatRoomViewController
        detailVC.text = phrase!
        present(detailVC, animated: true, completion: nil)
    }
}
