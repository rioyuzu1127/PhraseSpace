//
//  PhraseEditViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/03.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit


class PhraseEditViewController : BaseViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var shouldEditText: UITextField!
    let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var row : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shouldEditText.text = appDelegate.phraseList.phraseList[self.row!].phrase
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func finishEditing(_ sender: Any) {
        let contents = shouldEditText.text
        appDelegate.phraseList.phraseList[self.row!].phrase = contents
        let queue = DispatchQueue(label: "communication", attributes: [])
        queue.async(execute: {
            self.callApi(contents!)
        })
    }
    
    func callApi(_ text: String) {
        var param = [String:Any]()
        param[JsonTag.Contents] = text
        param[JsonTag.PhraseId] = PreferenceKey.PhraseId.getValue()
        ApiClient.call(type: CommunicationType.update_Phrase, param: param, {(request:Request?) -> Void in
            self.finishCallApi()
        }, {(request:Request?) -> Void in
            
        })
    }
    
    override func finishCallApi() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "PhraseDetail", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "PhraseDetailViewController") as! PhraseDetailViewController
            nextVC.row = self.row
            //self.present(nextVC, animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelEditing(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
