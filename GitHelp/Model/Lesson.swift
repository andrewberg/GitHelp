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
}

extension Lesson {
    private enum Keys: String, SerializationKey {
        case name = "title"
        case text = "body"
    }
    
    init(serialization: Serialization) {
        name = serialization.value(forKey: Keys.name)!
        text = serialization.value(forKey: Keys.text)!
    }
}
