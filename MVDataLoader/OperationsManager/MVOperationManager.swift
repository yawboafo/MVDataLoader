//
//  MVOperationManager.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

open class MVOperationManager {
    
    
    private let queueManager: MVOperationQueue
    
    // MARK: - Init
    
    init(withQueueManager queueManager: MVOperationQueue = MVOperationQueue.shared) {
        self.queueManager = queueManager
       
    }
    
    
  public  func loadData(url: String, completionHandler: @escaping (_ result: MVDataResponse) ->Void) {
        
        let operation = MVLoadAnyDataOperation(url: url)
        operation.qualityOfService = .background
        operation.completionHandler = completionHandler
        operation.name = url
        queueManager.enqueue(operation)
        
    }
    
    
   
    
    
   public func cancelOperation(url: String) {
        for ops in queueManager.queue.operations {
            
            if ops.name == url {
              if ops.isExecuting {
                    ops.cancel()
                    print("i found the operation \(ops.dependencies)")
                }
                
        return
            }
        }
        
        
        
    }
}
