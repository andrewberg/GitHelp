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
    
    var curQuestion = -1
    var curAnswer = 0
    var curMax = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        curMax = quiz.questions.count
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        if curQuestion < curMax-1 {
            curQuestion += 1
            
            numQuestion.text = "Question \(curQuestion+1) of \(curMax)"
            
            questionLabel.text = quiz.questions[curQuestion].text
            
            answer0.setTitle(quiz.questions[curQuestion].options[0], for: .normal)
            answer1.setTitle(quiz.questions[curQuestion].options[1], for: .normal)
            answer2.setTitle(quiz.questions[curQuestion].options[2], for: .normal)
            
            curAnswer = quiz.questions[curQuestion].answer
            
        }
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

    @IBAction func nextButton(_ sender: Any) {
        nextQuestion()
    }
    
}
