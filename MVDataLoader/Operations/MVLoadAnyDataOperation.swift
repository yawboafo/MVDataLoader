//
//  MVLoadAnyDataOperation.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

import Foundation

class MVLoadAnyDataOperation: MVOperation<MVDataResponse> {
    
    private let session: URLSession
    private var urlString: String = ""
    private var task: URLSessionTask?
    var  cache =   MVCache()
    
    
    
    
    // Constructor  with Url and URLSession
    init(session: URLSession = URLSession.shared, url: String) {
        self.session = session
        self.urlString = url
        
    }
    
     // Overload Constructor  with memoryMax limit included
    init(cacheMaxCapacity: Int, url: String,session: URLSession = URLSession.shared) {
        self.cache =  MVCache(maxMemoryLimit: cacheMaxCapacity)
        self.session = session
        self.urlString = url
    }
    
    
    

    override func main() {
        
        guard let imageURL = URL(string: urlString) else {
            cancel()
            return
        }
        
        
        // Prepare urlRequest
        var urlRequest = URLRequest(url: imageURL)
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        
        
        
        //Fetch data if avaiable in Cache
        if let cachedData = cache.sharedCache.cachedResponse(for: urlRequest) {
            
            // Prepare Data to prevent throwing nil
            var _data = Data()
            
            
            //Dispatch to main thread
            DispatchQueue.main.async {
                _data = cachedData.data
                let data = MVDataResponse(err: "No error",data:_data)
                self.complete(result: data )
                }
            
            //if data found cancel Operation
            cancel()
            
        }
        
        
        
        //else shot a urlsession dast
        task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                
                //On response prepare MVDataResponse with data and error even if nil
                let data = MVDataResponse(err: "\(String(describing: error))",data: data ?? Data())
                
               
                //Cache data
                self.cache.sharedCache.storeCachedResponse(
                    CachedURLResponse(
                        response: response ?? URLResponse(),
                        data: data.data),
                    for: urlRequest)
                
                
                self.complete(result: data)
            }
            
        })
        task?.resume()
        
        
        
    }
    
    // MARK: - Cancel
    
    override func cancel() {
        task?.cancel()
        super.cancel()
    }
    
    
}
