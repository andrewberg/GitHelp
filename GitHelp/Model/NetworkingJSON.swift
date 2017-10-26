//
//  NetworkingJSON.swift
//  GitHelp
//
//  Created by Andrew on 10/10/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation

/* Implemented by Andrew */
/*class NetworkingJSON {
    var lessons = [Lesson]()

    func getLessonsFromURL(url: String) {
        //creating a NSURL
        let url = NSURL(string: url)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //getting the avengers tag array from json and converting it to NSArray
                if let lessonArray = jsonObj!.value(forKey: "lessons") as? NSArray {
                    //looping through all the elements
                    for lesson in lessonArray {
                        
                        //converting the element to a dictionary
                        if let lessonDict = lesson as? NSDictionary {
                            
                            let newLesson = Lesson()
                            
                            //getting the name from the dictionary
                            if let name = lessonDict.value(forKey: "lessonName") {
                                newLesson.name = name as! String
                            }
                            
                            if let number = lessonDict.value(forKey: "lessonNum") {
                                newLesson.number = number as! Int
                            }
                            
                            if let text = lessonDict.value(forKey: "lessonTxt") {
                                newLesson.text = text as! String
                            }
                        
                            self.lessons.append(newLesson)
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.completeLessons()
                })
            }
        }).resume()
        
    }
    
    func completeLessons() {
        for lesson in lessons {
            print("\(lesson.name) + \(lesson.number) + \(lesson.text)")
        }
    }
}*/
