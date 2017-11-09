//
//  QuizViewController.swift
//  GitHelp
//
//  Created by Jared on 11/7/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myQuizCollectionView: UICollectionView!

    fileprivate var request: AnyObject?
    
    let cellId = "cellId"
    let bgColor: UIColor = UIColor(red: 42.0/255.0, green: 62.0/255.0, blue: 68.0/255.0, alpha: 1.0)
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var myQuizzes: [Lesson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myQuizCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.myLabel.text = myQuizzes[indexPath.row].name
        cell.myLabel.textColor = UIColor.darkGray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

   
}

private extension QuizViewController {
    
    func configureUI(with lesson: Array<Lesson>) {
        for element in lesson {
            myQuizzes.append(element) // add every element fetched to the array
        }
        activityIndicator.stopAnimating() // stop the animation for waiting
        myQuizCollectionView.reloadData() // refresh the view so that the cells can populate
    }
    
    func fetchLesson() {
        let lessonsResource = LessonsResource()
        let lessonsRequest = ApiRequest(resource: lessonsResource)
        request = lessonsRequest
        lessonsRequest.load { [weak self] (lessons: [Lesson]?) in
            guard let lessons = lessons else {
                print("nothing")
                return
            }
            
            self?.configureUI(with: lessons)
        }
    }
}
