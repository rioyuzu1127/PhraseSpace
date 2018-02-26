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
        self.callProcess()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showGlobal()
    }
    
    func showGlobal() {
        self.showView(ViewId.phraseTable, animation: true)
    }
}
