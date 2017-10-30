//
//  GitHelpTests.swift
//  GitHelpTests
//
//  Created by Andrew on 10/15/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import XCTest
@testable import GitHelp

    /* Implemented by Andrew */
class GitHelpTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    /* Implemented by Andrew */
    func testNetworkingRequest() {
        var y = [Lesson]()
        
        // Networking object
        func fetchLesson() {
            let lessonsResource = LessonsResource()
            let lessonsRequest = ApiRequest(resource: lessonsResource)
            lessonsRequest.load { [weak self] (lessons: [Lesson]?) in
                guard let lessons = lessons else {
                        print("nothing")
                        return
                }
                
                y = lessons
                print(y)
                
            }
        }
        
        // describes the test object
        let promise = expectation(description: "JSON Objects returned")
        
        // what we expect from this test
        if y.count > 0 {
            promise.fulfill()
        }
        
        // give it 5 seconds to complete if not something is wrong
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
