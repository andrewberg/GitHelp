//
//  Quiz.swift
//  GitHelp
//
//  Created by Andrew on 11/26/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation

struct Quiz {
    let title: String
    let questions: [Question]
}

extension Quiz {
    private enum Keys: String, SerializationKey {
        case title = "title"
        case questions = "questions"
    }
    
    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)!
        
        let userSerializations: [Serialization] = serialization.value(forKey: Keys.questions)!
        questions = userSerializations.map(Question.init)
        
        
    }
}
