//
//  Utility.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 16/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

func background(work: @escaping () -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
        work()
    }
}

func main(work: @escaping () -> ()) {
    DispatchQueue.main.async {
        work()
    }
}


class Utility {

    private let dataLoader = MVOperationManager()
     public func getImage(stringURL: String,defaultImage: UIImage, completionHandler: @escaping (_ result: UIImage) ->Void){
        
        let image = defaultImage
       
        if let _image = MVNsCache.shared[stringURL as NSString] {
            
            main {
                
                completionHandler(_image)
            }
            
        }else{
            dataLoader.loadData(url: stringURL) { (data) in
                if let  _image = UIImage(data: data.data ?? Data()) {
                    MVNsCache.shared[stringURL as NSString] = _image
                    
                    main {
                        
                        completionHandler(_image)
                    }
                }else{
                    
                    main {
                        
                        completionHandler(image)
                    }
                }
            }
            
        }
        
        
        
        
        
    }
    
    func getImage(stringURL: String, completionHandler: @escaping (_ result: UIImage) ->Void){
        
        let image = UIImage()
      
        if let _image = MVNsCache.shared[stringURL as NSString] {
            
            main {
                completionHandler(_image)
            }
            
        }else{
            dataLoader.loadData(url: stringURL) { (data) in
                if let  _image = UIImage(data: data.data ?? Data()) {
                    MVNsCache.shared[stringURL as NSString] = _image
                    main {
                        completionHandler(_image)
                    }
                }else{
                    
                    main {
                        completionHandler(image )
                    }
                }
            }
            
        }
        
        
        
        
        
    }
    
}
