//
//  MVCreateImageOperation.swift
//  MVDataLoader
//
//  Created by Engineer 144 on 14/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import UIKit
class MVCreateImageOperation : MVRegularOperation<UIImage> {
    
    
    private let colorCode: String
    private var urlString: String = ""
   
    
    init(_colorCode: String ,_url: String ) {
        self.colorCode = _colorCode
        self.urlString = _url
        
    }
    
    
    
    override public func main() {
        
        if isCancelled {
            return
        }
        
       
        
        if (self.urlString.isEmpty){
            
            self.cancel()
            
        }else{
            
            let  colorImage  = imageWithColor(color: hexStringToUIColor(hex: self.colorCode))
            self.complete(result: colorImage!)
            self.cancel()
        }
        
       
        
    }
    
    
     func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func imageWithColor(color: UIColor, size: CGSize=CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    // MARK: - Cancel
    
    
    
    override func cancel() {
        
        super.cancel()
    }
    
}



