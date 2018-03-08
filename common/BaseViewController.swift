//
//  BaseViewController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/14.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    enum ViewId {
        case splash
        case globalMenu
        case phraseDetail
        case phraseTable
    }
    
    static func loadViewController(_ viewId: ViewId) -> UIViewController {
        var storyboardName: String
        var viewControllerName: String
        
        switch viewId {
        case ViewId.globalMenu:
            storyboardName = "PhraseDetail"
            viewControllerName = "PhraseDetailViewController"
        case .splash:
            storyboardName = "Splash"
            viewControllerName = "SplashViewController"
        case .phraseDetail:
            storyboardName = "PhraseDetail"
            viewControllerName = "PhraseDetailViewController"
        case .phraseTable:
            storyboardName = "PhraseTable"
            viewControllerName = "PhraseTableViewController"
        }
        
        let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerName) as UIViewController
        return viewController
    }
    
    var viewId: ViewId?
    var param:[String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showView(_ viewId: ViewId, animation:Bool = false) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if viewId == .splash {
            appDelegate.navigationController?.dismiss(animated: false, completion: nil)
            appDelegate.navigationController = nil
            return
        }
        
        if appDelegate.navigationController == nil {
            appDelegate.navigationController = UINavigationController(rootViewController: BaseViewController())
            UIApplication.shared.keyWindow?.addSubview(appDelegate.navigationController!.view)
            appDelegate.navigationController?.isNavigationBarHidden = true
        }
        
        if viewId == .globalMenu{
            let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
            let dstView = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
            appDelegate.navigationController?.pushViewController(dstView, animated: false)
        }
        else if viewId == .phraseTable {
            let storyboard = UIStoryboard(name: "PhraseTable", bundle: nil)
            let dstView = storyboard.instantiateViewController(withIdentifier: "PhraseTableViewController") as! PhraseTableViewController
            appDelegate.navigationController?.pushViewController(dstView, animated: false)
        } else {
            let viewController = BaseViewController.loadViewController(viewId) as! BaseViewController
            viewController.viewId = viewId
            
            appDelegate.navigationController?.pushViewController(viewController, animated: false)
            
            if self is SplashViewController {
                self.present(appDelegate.navigationController!, animated: animation, completion: nil)
            }
        }
    }
    
    func callProcess() {
        print("callProcess")
        let queue = DispatchQueue(label: "communication", attributes: [])
        queue.async(execute: {
            self.callApi(CommunicationType.get_Phrase)
        })
    }
    
    func callApi(_ type:CommunicationType) {
        print("callApi")
        var param:[String:Any]?
        param = [String:Any]()
        ApiClient.call(type: type, param: param, {(request:Request?) -> Void in
            let jsonData = request?.accessresponseData!.data(using: String.Encoding.utf8)
            do {
                if let jsonDic = try JSONSerialization.jsonObject(with: jsonData!, options: .mutableContainers) as? NSMutableDictionary {
                    // 成功時の処理
                    switch request!.accesstype {
                    case .get_Phrase:
                        self.parsePhrase(jsonDic)
                        self.finishCallApi()
                    case .update_Phrase:
                        self.parsePhrase(jsonDic)
                    }
                }
            } catch {
                
            }
        } , {(request:Request?) -> Void in
            
        })
    }
    
    // 通信が終わった後に来る処理
    func finishCallApi() {

    }
    
    
    func parsePhrase(_ jsonObject:NSDictionary) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let result: NSDictionary = jsonObject
        appDelegate.phraseList = PhraseList()
        if !(result[JsonTag.PhraseList] == nil) {
            let PhraseList: NSArray = (result[JsonTag.PhraseList] as? NSArray)!
            if PhraseList.count > 0 {
                for jsonData in PhraseList {
                    let data:NSDictionary = jsonData as! NSDictionary
                    let phraseEntity = Phrase()
                    let phraseId: Int64 = data[JsonTag.PhraseId] as! Int64
                    phraseEntity.phraseId = phraseId
                    let phrase : String = data[JsonTag.Phrase] as! String
                    phraseEntity.phrase = phrase
                    let category : String = data[JsonTag.Category] as! String
                    phraseEntity.category = category
                    let overview : String = data[JsonTag.Overview] as! String
                    phraseEntity.overView = overview
                    appDelegate.phraseList.phraseList.append(phraseEntity)
                }
            }
        }
    }
    
}

