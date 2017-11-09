//
//  TemplateViewController.swift
//  GitHelp
//
//  Created by Jared on 11/9/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class TemplateViewController: BaseViewController {
    
    var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTextView()
        self.view.addSubview(myTextView)
    }
    
    func setTextView(text: String) {        
        myTextView.text = text
    }
    
    func customizeTextView(){
        myTextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        myTextView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10)
        myTextView.center = self.view.center
        myTextView.textAlignment = NSTextAlignment.justified
        myTextView.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        myTextView.textColor = UIColor.white
        myTextView.backgroundColor = bgColor
    }

}
