//
//  MVDataResponse.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

public struct MVDataResponse {
    var error: String
    var data: Data
    
    init(err: String, data: Data) {
        self.error = err
        self.data = data
    }
}
