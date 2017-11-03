//
//  LessonViewController.swift
//  GitHelp
//
//  Created by Jared on 10/31/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController {
    
    fileprivate var request: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call fetch lessons
        fetchLesson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}

private extension LessonViewController {
    func configureUI(with lesson: Array<Lesson>) {
        for element in lesson{
            print(element)
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

