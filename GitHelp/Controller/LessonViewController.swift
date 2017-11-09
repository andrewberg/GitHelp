//
//  LessonViewController.swift
//  GitHelp
//
//  Created by Jared on 10/31/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    fileprivate var request: AnyObject?
    
    let cellId = "cellId"
    let bgColor: UIColor = UIColor(red: 42.0/255.0, green: 62.0/255.0, blue: 68.0/255.0, alpha: 1.0)
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var myLessons: [Lesson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyCollectionView() // setup properties
        startWaitIndicator() // start anamating the indicator
        fetchLesson() // fetch lessons
    }
    
    func startWaitIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func setupMyCollectionView(){
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        myCollectionView?.backgroundColor = bgColor
        
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Lesson"
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { 
        let newViewController = UIViewController()
        newViewController.navigationItem.title = myLessons[indexPath.row].name
        newViewController.view.backgroundColor = bgColor
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myLessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.myLabel.text = myLessons[indexPath.row].name
        cell.myLabel.textColor = UIColor.darkGray
        
        return cell
    }
}

private extension LessonViewController {
    
    func configureUI(with lesson: Array<Lesson>) {
        for element in lesson {
            myLessons.append(element) // add every element fetched to the array
        }
        activityIndicator.stopAnimating() // stop the animation for waiting
        myCollectionView.reloadData() // refresh the view so that the cells can populate
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