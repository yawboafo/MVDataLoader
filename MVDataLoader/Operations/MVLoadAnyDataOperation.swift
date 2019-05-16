//
//  MVLoadAnyDataOperation.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation



 internal class MVLoadAnyDataOperation: MVOperation<MVDataResponse> {
    
    //let session = URLSession()

    private let session: URLSession
    private var urlString: String = ""
    private var task: URLSessionTask?
    var  cache =   MVUrlCache().sharedCache
    var httpClient: MVHttpRequest!
    
    
    
    // Constructor  with Url and URLSession
    init(session: URLSession = URLSession.shared, url: String) {
        self.session = session
        self.urlString = url
        httpClient = MVHttpRequest(session: session)

        
    }
    
  
    
  
    
    

    override public func main() {
        
        if isCancelled {
            return
        }
        
        guard let imageURL = URL(string: urlString) else {
            cancel()
            return
        }
        
        
        // Prepare urlRequest
        var urlRequest = URLRequest(url: imageURL)
         urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        
        
        
        //Fetch data if avaiable in Cache
        if let cachedData = cache.cachedResponse(for: urlRequest) {
            
            // Prepare Data to prevent throwing nil
            //var _data = Data()
            
            
            //Dispatch to main thread
            DispatchQueue.main.async {
                //_data = cachedData
                let data = MVDataResponse("" as AnyObject, cachedData.data ,"" as AnyObject )
                
                self.complete(result: data)
                //if data found cancel Operation
                self.cancel()
                print("FROM CACHE : \(cachedData.data)")
                
                
                }
            
            //if data found cancel Operation
            
           
        }else {
            
            
            
            httpClient.getData(urlRequest: urlRequest) { (data, error, response) in
                
                DispatchQueue.main.async {
                    
                    
                    if error != nil && response != nil {
                        
                        self.cache.storeCachedResponse(
                            CachedURLResponse(
                                response: response ?? URLResponse(),
                                data: data ?? Data()),
                            for: urlRequest)
                        
                        
                        //On response prepare MVDataResponse with data and error even if nil
                        let _data = MVDataResponse(error as AnyObject,data ?? Data(), response as AnyObject)
                        self.complete(result: _data)
                        self.cancel()
                        print("FROM URLSESSION : \(data ?? Data())")
                    }else{
                        
                        let _data = MVDataResponse(error as AnyObject,data ?? Data(), response as AnyObject)
                        self.complete(result: _data)
                        self.cancel()
                    }
                    
                    
                    
                }
            }
            

            
        }
        
        
        
     
        
        
        
    }
    
    // MARK: - Cancel
    
    
    
    override func cancel() {
        task?.cancel()
        super.cancel()
    }
    
    
}
