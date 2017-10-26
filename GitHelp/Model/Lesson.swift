//
//  Lesson.swift
//  GitHelp
//
//  Created by Andrew on 10/10/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation

/* Implemented by Andrew */

struct Lesson {
    let name: String
    let text: String
    let num: Int
}

extension Lesson {
    private enum Keys: String, SerializationKey {
        case name = "lessonName"
        case text = "lessonTxt"
        case num = "lessonNum"
    }
    
    init(serialization: Serialization) {
        name = serialization.value(forKey: Keys.name)!
        text = serialization.value(forKey: Keys.text)!
        num = serialization.value(forKey: Keys.num)!
    }
}
