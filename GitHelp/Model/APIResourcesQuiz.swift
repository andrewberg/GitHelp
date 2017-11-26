//
//  APIResourcesQuiz.swift
//  GitHelp
//
//  Created by Andrew on 11/26/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation

struct ApiWrapperQuiz {
    let items: [Serialization]
}

extension ApiWrapperQuiz {
    private enum Keys: String, SerializationKey {
        case items = "quizzes"
    }
    
    init(serialization: Serialization) {
        items = serialization.value(forKey: Keys.items) ?? []
    }
}

protocol ApiResourceQuiz {
    associatedtype Model
    func makeModel(serialization: Serialization) -> Model
}

extension ApiResourceQuiz {
    var url: URL {
        let url = "http://45.55.51.127/quizzes.json"
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return nil
        }
        guard let jsonSerialization = json as? Serialization else {
            return nil
        }
        let wrapper = ApiWrapperQuiz(serialization: jsonSerialization)
        return wrapper.items.map(makeModel(serialization:))
    }
}

struct QuizzesResource: ApiResourceQuiz {
    
    func makeModel(serialization: Serialization) -> Quiz {
        return Quiz(serialization: serialization)
    }
}

