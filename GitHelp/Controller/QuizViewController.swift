//
//  QuizViewController.swift
//  GitHelp
//
//  Created by Jared on 11/7/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class QuizViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myQuizCollectionView: UICollectionView!

    fileprivate var request: AnyObject?
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var myQuizzes: [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyCollectionView() // setup properties
        startWaitIndicator() // start anamating the indicator
        fetchQuizzes() // fetch lessons
    }
    
    func startWaitIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func setupMyCollectionView(){
        myQuizCollectionView?.delegate = self
        myQuizCollectionView?.dataSource = self
        myQuizCollectionView?.backgroundColor = bgColor
        
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Quizzes"
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "quiz") as! QuizTemplateViewController
        
       
        resultViewController.quiz = myQuizzes[indexPath.row]        
        resultViewController.navigationItem.title = myQuizzes[indexPath.row].title
        resultViewController.view.backgroundColor = bgColor
        navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.pushViewController(resultViewController, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myQuizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myQuizCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCellQuiz
        
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.myLabel.text = myQuizzes[indexPath.row].title
        cell.myLabel.textColor = UIColor.darkGray
        
        return cell
    }
}

private extension QuizViewController {
    
    func configureUI(with quizzes: Array<Quiz>) {
        for element in quizzes {
            myQuizzes.append(element) // add every element fetched to the array
        }
        
        activityIndicator.stopAnimating() // stop the animation for waiting
        myQuizCollectionView.reloadData() // refresh the view so that the cells can populate
    }
    
    func fetchQuizzes() {
        let quizzesResource = QuizzesResource()
        let quizzesRequest = ApiRequestQuiz(resource: quizzesResource)
        request = quizzesRequest
        quizzesRequest.load { [weak self] (quizzes: [Quiz]?) in
            
            guard let quizzes = quizzes else {
                print("nothing")
                return
            }
            //print(quizzes)
            self?.configureUI(with: quizzes)
        }
    }
}
