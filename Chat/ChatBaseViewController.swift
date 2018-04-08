//
//  ChatBaseViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/25.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class ChatBaseViewController : BaseViewController, UpdateChatTableDelegate {
    
    func updateChat(_ text : String) {
        self.childViewControllers.forEach {vc in
            if vc is ChatRoomViewController {
                let crc = vc as! ChatRoomViewController
                chat.chatId = Int64(appDelegate.chatList.chatList.count)
                chat.myId = 1
                chat.opponentId = 2
                chat.talkContents = text
                appDelegate.chatList.chatList.append(chat)
                crc.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var inputFieldView: InputFieldView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var chat = Chat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputFieldView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func dismissView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ChatPage", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ChatPageViewController") as! ChatPageViewController
        appDelegate.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SelectPhrase", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SelectPhraseViewController") as! SelectPhraseViewController
        //present(detailVC, animated: true, completion: nil)
        appDelegate.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return inputFieldView
    }
    
}
