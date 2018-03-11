//
//  ChatViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/10.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class ChatViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        tableView.register(UINib(nibName: "YourTableViewCell", bundle: nil), forCellReuseIdentifier: "YourTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myId = appDelegate.chatList.chatList[indexPath.row].myId
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        if myId == 1 {
            
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "YourTableViewCell", for: indexPath) as! YourTableViewCell
            return cell
        }
        return cell
    }
    
}
