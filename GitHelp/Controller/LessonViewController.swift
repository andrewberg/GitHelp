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
    //myCollectionView?.register()
    
    let cellId = "cellId"
    fileprivate var request: AnyObject?
    var myLessons: [Lesson]!
    var test = ["chapter1", "chapter2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        print("lessons size before fetch \(test.count)")
        // call fetch lessons
        fetchLesson()
        print("lessons size after fetch \(test.count)")
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        cell.myLabel.text = test[indexPath.row]
        cell.backgroundColor = UIColor.blue
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