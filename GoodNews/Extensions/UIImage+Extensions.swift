//
//  UIImage+Extensions.swift
//  GoodNews
//
//  Created by Shreya on 12/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    static func imageForPlaceholder() -> UIImage{
        return UIImage(named: "placeholder")!
        
        
    }
    static func imageForHeadline(url:String,completion: @escaping (UIImage) -> ()){
        guard let imageUrl = URL(string: url) else {
            completion(UIImage.imageForPlaceholder())
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageUrl){
                if let downloadedImage = UIImage(data: data) {
                    completion(downloadedImage)
                }
            }
        }
        
        
    }
}
