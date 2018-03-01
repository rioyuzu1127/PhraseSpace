//
//  PhraseDetailViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/14.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class PhraseDetailViewController : BaseViewController {
    
    @IBOutlet weak var naviView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
