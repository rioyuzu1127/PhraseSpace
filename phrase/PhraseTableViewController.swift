//
//  PhraseTableViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/14.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class PhraseTableViewController : BaseViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyMessage: UIView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var phraseList : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PhraseTableCell", bundle: nil), forCellReuseIdentifier: "PhraseTableCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension PhraseTableViewController: UITableViewDelegate {
    
}

extension PhraseTableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appDelegate.phraseList?.phraseList.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let phrase = appDelegate.phraseList.phraseList[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PhraseTableCell", for: indexPath) as! PhraseTableCell
        cell.phraseLabel.text = phrase.phrase
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "PhraseDetail", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "PhraseDetailViewController")
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
}
