//
//  MockURLSession.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 16/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
//MARK: MOCK

class MockURLSession: URLSessionProtocol {
    
    
    
    var nextDataTask = MockURLSessionDataTask()
    
    var nextData: Data?
    
    var nextError: Error?
    
    
    
    private (set) var lastURL: URL?
    
    
    
    func successHttpURLResponse(request: URLRequest) -> URLResponse {
        
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        
    }
    
    
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        
        lastURL = request.url
        
        
        
        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        
        return nextDataTask
        
    }
    
    
    
}
