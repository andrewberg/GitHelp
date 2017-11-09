//
//  APIResources.swift
//  GitHelp
//
//  Created by Andrew on 10/24/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation

/* Implemented by Andrew */

struct ApiWrapper {
    let items: [Serialization]
}

extension ApiWrapper {
    private enum Keys: String, SerializationKey {
        case items = "lessons"
    }
    
    init(serialization: Serialization) {
        items = serialization.value(forKey: Keys.items) ?? []
    }
}

protocol ApiResource {
    associatedtype Model
    func makeModel(serialization: Serialization) -> Model
}

extension ApiResource {
    var url: URL {
        let url = "http://bergcode.com/heroes.json"
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return nil
        }
        guard let jsonSerialization = json as? Serialization else {
            return nil
        }
        let wrapper = ApiWrapper(serialization: jsonSerialization)
        return wrapper.items.map(makeModel(serialization:))
    }
}

struct LessonsResource: ApiResource {
    
    func makeModel(serialization: Serialization) -> Lesson {
        return Lesson(serialization: serialization)
    }
}
