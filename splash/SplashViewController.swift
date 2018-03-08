//
//  SplashViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/20.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class SplashViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi(CommunicationType.get_Phrase)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func finishCallApi() {
        DispatchQueue.main.async {
            self.showView(ViewId.phraseTable, animation: true)
        }
    }
}
