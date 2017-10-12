//
//  ViewController.swift
//  GitHelp
//
//  Created by Andrew on 10/9/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let net = NetworkingJSON()
        
       
        // var x = [Lesson]()
        
        net.getLessonsFromURL(url: "http://bergcode.com/heroes.json")

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

