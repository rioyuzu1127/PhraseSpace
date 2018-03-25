//
//  ChatBaseViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/25.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class ChatBaseViewController : BaseViewController {
    
    
    @IBOutlet weak var inputFieldView: InputFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return inputFieldView
    }
    
}
