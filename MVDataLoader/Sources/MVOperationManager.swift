//
//  MVOperationManager.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

open class MVOperationManager {
    
    
    public let queueManager: MVOperationQueue
    
    // MARK: - Init
    
   public init() {
        self.queueManager = MVOperationQueue.shared
       
    }
    
    
    
    // MARK Load AnyData
    
  public  func loadData(url: String, completionHandler: @escaping (_ result: MVDataResponse) ->Void) {
        
        let operation = MVLoadAnyDataOperation(url: url)
        operation.qualityOfService = .background
        operation.queuePriority = .veryHigh
        operation.completionHandler = completionHandler
        operation.name = url
        queueManager.enqueue(operation)
        
    }
    
    
    //MARK - not very useful
    
    public  func generateRandonImage(url: String,color:String , completionHandler: @escaping (_ result: UIImage) ->Void) {
        
        let operation = MVCreateImageOperation(_colorCode: color, _url: url)
        operation.qualityOfService = .background
        operation.completionHandler = completionHandler
        operation.name = url
        queueManager.enqueue(operation)
        
    }
    

    
    public func slowOperation(operationID: String){
        for ops in queueManager.queue.operations {
            
            if ops.name == operationID {
                if ops.isExecuting && !ops.isFinished {
                    ops.queuePriority = .low
                    print("i found the operation \(String(describing: ops.name))")
                    
                    break
                    
                }
        }
        }
        
    }
    
   public func cancelOperation(operationID: String) {
        for ops in queueManager.queue.operations {
            
            if ops.name == operationID {
              if ops.isExecuting && !ops.isFinished{
                
                    ops.cancel()
                    print("i found the operation \(ops.dependencies)")
                
                  break
                }
                
      
            }
        }
        
        
        
    }
}
