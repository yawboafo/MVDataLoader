//
//  MVOperationManager.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation


import Foundation


 public class MVOperationQueue {

    
    // MARK: - Singleton
    
    static let shared = MVOperationQueue()
    
    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "MVOperationManager"
        queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
        return queue;
    }()
    
  
    
    // MARK: - Addition
    
    func enqueue(_ operation: Operation) {
        queue.addOperation(operation)
    }
}
