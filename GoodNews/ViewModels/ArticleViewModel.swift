//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Shreya on 11/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit



struct ArticleViewModel {
    private(set) var article : Article
    
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }

}

extension ArticleViewModel{
    var title : String {
        return self.article.title
    }
    
    var description :  String? {
        return self.article.description
    }
    
    func image(completion: @escaping (UIImage?) -> ()) {
        
        guard let imageURL = article.imageURL else  {
            completion(nil)
            return
        }
        
        UIImage.imageForHeadline(url: imageURL) { (image) in
            
            DispatchQueue.main.async {
                completion(image)
            }
            
        }
        
        
    }
}
