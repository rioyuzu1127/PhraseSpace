//
//  Constants.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/20.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

enum PreferenceKey : String {
    
    case PhraseId = "phrase_id"
    
    case Phrase = "phrase"
    
    case CategoryId = "category_id"
    
    case ID = "id"
    
    case OverView = "overview"
    
    func setValue(_ value: Any?) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getValue() -> Any? {
        if Thread.current.isMainThread {
            return UserDefaults.standard.object(forKey: self.rawValue)
        } else {
            var result : Any? = nil
            DispatchQueue.main.sync {
                result = UserDefaults.standard.object(forKey: self.rawValue)
            }
            return result
        }
    }
}
