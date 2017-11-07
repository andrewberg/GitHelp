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
    var myLessons: [Lesson]!
    var test = ["chapter1", "chapter2", "chapter3", "chapter4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("lessons size before fetch \(test.count)")
        fetchLesson() // call fetch lessons
        print("lessons size after fetch \(test.count)")
        setupMyCollectionView()
        
    }

    func setupMyCollectionView(){
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        myCollectionView?.backgroundColor = UIColor(red: 42.0/255.0, green: 62.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        //myCollectionView?.register()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        cell.myLabel.text = test[indexPath.row]
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
}

private extension LessonViewController {
    
    func configureUI(with lesson: Array<Lesson>) {
        for element in lesson {
            print(element.name)
        }
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