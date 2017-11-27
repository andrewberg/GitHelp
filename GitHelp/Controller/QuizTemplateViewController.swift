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
    let right = "Correct"
    let wrong = "Wrong"

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numQuestion: UILabel!

    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var curQuestion = -1
    var curAnswer = 0
    var curMax = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout() // changes the look and style of the buttons and text
        curMax = quiz.questions.count
        
        nextQuestion()
        
    }
    
    func setLayout() {
        answer0.backgroundColor = UIColor.white
        answer0.layer.cornerRadius = 10.0
        answer0.layer.borderWidth = 2
        answer0.layer.borderColor = UIColor.lightGray.cgColor
        answer0.setTitleColor(UIColor.darkGray, for: .normal)
        
        answer1.backgroundColor = UIColor.white
        answer1.layer.cornerRadius = 10.0
        answer1.layer.borderWidth = 2
        answer1.layer.borderColor = UIColor.lightGray.cgColor
        answer1.setTitleColor(UIColor.darkGray, for: .normal)
        
        answer2.backgroundColor = UIColor.white
        answer2.layer.cornerRadius = 10.0
        answer2.layer.borderWidth = 2
        answer2.layer.borderColor = UIColor.lightGray.cgColor
        answer2.setTitleColor(UIColor.darkGray, for: .normal)
        
        questionLabel.adjustsFontSizeToFitWidth = true
    }
    
    func alertPopUp(answer: String) {
        let alert = UIAlertController(title: answer, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func nextQuestion() {
        
        // reset the question guideline
        
        if curQuestion == curMax - 1 {
            curQuestion = -1
            nextButton.setTitle("Next Question", for: .normal)
        }
        
        
        if curQuestion < curMax-1 {
            curQuestion += 1
            
            numQuestion.text = "Question \(curQuestion+1) of \(curMax)"
            
            questionLabel.text = quiz.questions[curQuestion].text
            
            answer0.setTitle(quiz.questions[curQuestion].options[0], for: .normal)
            answer1.setTitle(quiz.questions[curQuestion].options[1], for: .normal)
            answer2.setTitle(quiz.questions[curQuestion].options[2], for: .normal)
            
            curAnswer = quiz.questions[curQuestion].answer
        }
        
        if curQuestion == curMax - 1 {
            nextButton.setTitle("Reset Quiz", for: .normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func butOne(_ sender: Any) {
        
        if curAnswer == 0 {
            alertPopUp(answer: right)
        } else {
            alertPopUp(answer: wrong)
        }
    }

    @IBAction func butTwo(_ sender: Any) {
        if curAnswer == 1 {
            alertPopUp(answer: right)
        } else {
            alertPopUp(answer: wrong)
        }
    }

    @IBAction func butThree(_ sender: Any) {
        if curAnswer == 2 {
            alertPopUp(answer: right)
        } else {
            alertPopUp(answer: wrong)
        }
    }

    @IBAction func nextButton(_ sender: Any) {
        nextQuestion()
    }
    
}
