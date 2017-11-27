//
//  QuizTemplateViewController.swift
//  GitHelp
//
//  Created by Andrew on 11/26/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class QuizTemplateViewController: UIViewController {
    
    var quiz: Quiz!

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numQuestion: UILabel!

    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    
    var curQuestion = 0
    var curAnswer = 0
    var curMax = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        curMax = quiz.questions.count
        
        questionLabel.text = quiz.questions[0].text
        
        answer0.setTitle(quiz.questions[0].options[0], for: .normal)
        answer1.setTitle(quiz.questions[0].options[1], for: .normal)
        answer2.setTitle(quiz.questions[0].options[2], for: .normal)
        
        curAnswer = quiz.questions[0].answer
        
        print(curMax)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func butOne(_ sender: Any) {
        if curAnswer == 0 {
            print("right")
        } else {
            print("wrong")
        }
    }

    @IBAction func butTwo(_ sender: Any) {
        if curAnswer == 1 {
            print("right")
        } else {
            print("wrong")
        }
    }

    @IBAction func butThree(_ sender: Any) {
        if curAnswer == 2 {
            print("right")
        } else {
            print("wrong")
        }
    }
    
    
}
