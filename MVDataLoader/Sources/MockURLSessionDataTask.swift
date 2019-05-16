//
//  MockURLSessionDataTask.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 16/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    private (set) var resumeWasCalled = false
    
    
    
    func resume() {
        
        resumeWasCalled = true
        
    }
    
}
