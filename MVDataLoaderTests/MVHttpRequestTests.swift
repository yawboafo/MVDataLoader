//
//  HttpRequestTests.swift
//  MVDataLoaderTests
//
//  Created by Engineer 144 on 15/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import XCTest
@testable import MVDataLoader
//MARK: Test
class MVHttpRequestTests: XCTestCase {
    
    var httpClient: MVHttpRequest!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        httpClient = MVHttpRequest(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_get_request_with_URL() {
        
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        
        // Prepare urlRequest
        let urlRequest = URLRequest(url: url)
        
              httpClient.getData(urlRequest: urlRequest) { (data, error, response) in
            // Return data
        }
        
        XCTAssert(session.lastURL == url)
        
    }
    
    func test_get_resume_called() {
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        
        // Prepare urlRequest
        let urlRequest = URLRequest(url: url)
       
       httpClient.getData(urlRequest: urlRequest) { (data, error, response) in
            // Return data
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        // Prepare urlRequest
        let urlRequest = URLRequest(url: url)
        
        httpClient.getData(urlRequest: urlRequest) { (data, error, response) in
          actualData = data
        }
       
        
        XCTAssertNotNil(actualData)
    }
   
    
   
}

// MVHttpRequestTests.defaultTestSuite.run()
