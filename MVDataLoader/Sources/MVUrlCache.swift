//
//  MVCache.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//


import Foundation
import UIKit




public class MVUrlCache {

    
    private var observer: NSObjectProtocol!
    let defaultMaxMemoryLimit = 30
    public static var shared = MVUrlCache()
    
    var sharedCache = URLCache()
    
    
   public init() {
        
     
           URLCache.shared  = sharedCache
           didreceiveMemoryWarning()
    }
    

    
    
    public func invalidateCache(){
    
    
        URLCache.shared.removeAllCachedResponses()
        
    
    }
    
    
   public func configureMaxmemoryLimit(maxMemoryLimit: Int){
          sharedCache =  URLCache(
            memoryCapacity: maxMemoryLimit * (1024*1024),
            diskCapacity: 0,
            diskPath: nil
        )
        URLCache.shared  = sharedCache
        didreceiveMemoryWarning()
        
    }
    
    //Observe memory warnings
    private func didreceiveMemoryWarning(){
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification, object: nil, queue: nil, using: {_ in
            
            //if warning received remove all cache
            self.sharedCache.removeAllCachedResponses()
            
        })
    }
    
    
    
    //Release observers if class destroyed
    deinit {
        NotificationCenter.default.removeObserver(observer)
    }
    
    
}
