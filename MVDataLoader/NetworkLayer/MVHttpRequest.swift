//

//  MVHttpRequest.swift

//  MVDataLoader

//

//  Created by Engineer 144 on 15/05/2019.

//  Copyright © 2019 Engineer 144. All rights reserved.

//



import Foundation

// Protocol for MOCK/Real

protocol URLSessionProtocol {
    
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    
    
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
    
}



protocol URLSessionDataTaskProtocol {
    
    func resume()
    
}



//MARK: HttpRequest Implementation

class MVHttpRequest {
    
    
    
    typealias completeClosure = ( _ data: Data?, _ error: Error?,_ response: URLResponse?)->Void
    
    
    
    private let session: URLSessionProtocol
    
    
    
    init(session: URLSessionProtocol) {
        
        self.session = session
        
        
        
    }
    
    
    
    func getData( urlRequest: URLRequest, callback: @escaping completeClosure ) {
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            callback(data, error, response)
            
        }
        
        task.resume()
        
    }
    
    
    
}



//MARK: Conform the protocol

extension URLSession: URLSessionProtocol {
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
        
    }
    
}



extension URLSessionDataTask: URLSessionDataTaskProtocol {}









