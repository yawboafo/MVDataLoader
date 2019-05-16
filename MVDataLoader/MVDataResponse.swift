//
//  MVDataResponse.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

public struct MVDataResponse {
    public var error: AnyObject?
    public var data: Data?
    public var response: AnyObject?
    
    
 
    init(_ err: AnyObject,_ data: Data,_ response: AnyObject) {
        self.error = err
        self.data = data
        self.response = response
    }
}
