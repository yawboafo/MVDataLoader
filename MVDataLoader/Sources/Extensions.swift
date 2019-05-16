//
//  Extensions.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 16/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import UIKit



//MVUrlCache.shared.configureMaxmemoryLimit(maxMemoryLimit: 9000)
  let utils = Utility()

public extension UIImageView {
    
    
  
    
    func setImage(stringURL: String,placeHolder: UIImage)  {
        
        
       utils.getImage(stringURL: stringURL, defaultImage: placeHolder) { (image) in
            

        main {
             self.image = image
           }
        
            
        }
    }
    
    func setImage(stringURL: String)  {
        
        
        utils.getImage(stringURL: stringURL) { (image) in
            
            
            main {
                self.image = image
            }
            
            
        }
    }
    
    
    
}
