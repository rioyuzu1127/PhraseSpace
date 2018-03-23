//
//  ChatRoomViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/19.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class ChatRoomViewController : BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var text : String = "フレーズ"
    
    var bottomView: ChatRoomInputView! //画面下部に表示するテキストフィールドと送信ボタン
    var chat : Chat!
    
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
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return bottomView
    }
    
    
    @IBAction func dismissView(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "ChatPage", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ChatPageViewController") as! ChatPageViewController
        present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func searchView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SelectPhrase", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SelectPhraseViewController") as! SelectPhraseViewController
        present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        chat.myId = 1
        chat.chatId = 3
        chat.opponentId = 2
        chat.talkContents = "Hello"
        appDelegate.chatList.chatList.append(chat)
        tableView.reloadData()
    }
    
    
}

extension ChatRoomViewController {
    func setupUI() {
        
        tableView.separatorColor = UIColor.clear // セルを区切る線を見えなくする
        tableView.estimatedRowHeight = 10000 // セルが高さ以上になった場合バインバインという動きをするが、それを防ぐために大きな値を設定
        tableView.rowHeight = UITableViewAutomaticDimension // Contentに合わせたセルの高さに設定
        tableView.allowsSelection = false // 選択を不可にする
        tableView.keyboardDismissMode = .interactive // テーブルビューをキーボードをまたぐように下にスワイプした時にキーボードを閉じる
        
        tableView.register(UINib(nibName: "MySideTableViewCell", bundle: nil), forCellReuseIdentifier: "MySide")
        tableView.register(UINib(nibName: "YourSideTableViewCell", bundle: nil), forCellReuseIdentifier: "YourSide")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "Header")
        
        self.bottomView = ChatRoomInputView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        
    }
}

extension ChatRoomViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.chatList.chatList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! HeaderTableViewCell
            cell.phraseLabel.text = self.text
            return cell
        }
        
        var num = appDelegate.chatList.chatList[indexPath.row-1].myId
        if num == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MySide") as! MySideTableViewCell
            cell.clipsToBounds = true //bound外のものを表示しない
            cell.textView.text = appDelegate.chatList.chatList[indexPath.row-1].talkContents
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
            cell.textview.text = appDelegate.chatList.chatList[indexPath.row-1].talkContents
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
    
}
