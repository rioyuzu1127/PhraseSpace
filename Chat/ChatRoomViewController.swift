//
//  ChatRoomViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/19.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class ChatRoomViewController : BaseViewController {
    
    
    var chat : Chat!
    
    @IBOutlet weak var tableView: UITableView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var text : String = "フレーズ"
    
    @IBOutlet weak var textFfield: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.text = PreferenceKey.tablePhrase.getValue() as! String
        tableView.reloadData()
    }
    
}

extension ChatRoomViewController {
    func setupUI() {
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.register(UINib(nibName: "MySideTableViewCell", bundle: nil), forCellReuseIdentifier: "MySide")
        tableView.register(UINib(nibName: "YourSideTableViewCell", bundle: nil), forCellReuseIdentifier: "YourSide")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "Header")
    }
}

extension ChatRoomViewController: UITableViewDataSource {
    
    //セクションの個数を返します
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.chatList.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! HeaderTableViewCell
//            cell.phraseLabel.text = self.text
//            return cell
//        }
        
        var num = appDelegate.chatList.chatList[indexPath.row].myId
        if num == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySide") as! MySideTableViewCell
            cell.clipsToBounds = true //bound外のものを表示しない
            cell.textView.text = appDelegate.chatList.chatList[indexPath.row].talkContents
            // 枠のカラー
            cell.textView.layer.borderColor = UIColor.gray.cgColor
            // 枠の幅
            cell.textView.layer.borderWidth = 1.0
            // 枠を角丸にする
            cell.textView.layer.cornerRadius = 10.0
            cell.textView.layer.masksToBounds = true
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourSide") as! YourSideTableViewCell
            cell.clipsToBounds = true
            cell.textview.text = appDelegate.chatList.chatList[indexPath.row].talkContents
            // 枠のカラー
            cell.textview.layer.borderColor = UIColor.gray.cgColor
            // 枠の幅
            cell.textview.layer.borderWidth = 1.0
            // 枠を角丸にする場合
            cell.textview.layer.cornerRadius = 10.0
            cell.textview.layer.masksToBounds = true
            return cell
        }
    }
    
    
}

extension ChatRoomViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView: UIView = UIView()
        var label = UILabel()
        label.text = PreferenceKey.tablePhrase.getValue() as! String
        label.frame = CGRect(x:4,y:10,width:320,height:20)
        myView.addSubview(label)
        return myView
    }

}
