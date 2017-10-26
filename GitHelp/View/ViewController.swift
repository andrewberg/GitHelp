//
//  ViewController.swift
//  GitHelp
//
//  Created by Andrew on 10/9/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var request: AnyObject?
    
    /* Implemented by Andrew */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchLesson()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

private extension ViewController {
    func configureUI(with lesson: Lesson) {
    }
    
    func fetchLesson() {
        let lessonsResource = LessonsResource()
        let lessonsRequest = ApiRequest(resource: lessonsResource)
        request = lessonsRequest
        lessonsRequest.load { [weak self] (lessons: [Lesson]?) in
            guard let lessons = lessons,
                let topLesson = lessons.first else {
                    print("nothing")
                    return
            }
            
            print(lessons)
            self?.configureUI(with: topLesson)
            
        }
    }
}

