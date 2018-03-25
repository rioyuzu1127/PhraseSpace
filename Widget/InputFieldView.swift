//
//  InputFieldView.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/03/25.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

protocol UpdateChatTableDelegate {
    func updateChat()
}

@IBDesignable class InputFieldView: UIView, UITextViewDelegate {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    private var base: UIView?
    var delegate : UpdateChatTableDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        textView.delegate = self
        customViewCommonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customViewCommonInit()
    }
    
    func customViewCommonInit(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "InputFieldView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        //base = view
        
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
    }
    
    @IBAction func clickAction(_ sender: AnyObject) {
        delegate?.updateChat()
    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        print(textView.text)
//    }
    
}

