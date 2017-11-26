//
//  Question.swift
//  GitHelp
//
//  Created by Andrew on 11/26/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: Int
}

extension Question {
    private enum Keys: String, SerializationKey {
        case text = "text"
        case choices = "choices"
        case num = "index"
    }
    
    init(serialization: Serialization) {
        text = serialization.value(forKey: Keys.text)!
        options = serialization.value(forKey: Keys.choices)!
        answer = serialization.value(forKey: Keys.num)!
    }
}
