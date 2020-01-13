//
//  CategoryService.swift
//  GoodNews
//
//  Created by Shreya on 07/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


class CategoryService {
    
    
    
    func getAllHeadlinesForAllCategories(completion: @escaping ([Category])-> ()) {
        
        var categories = [Category]()
        var requestCount = 0
        let categoriesCount = Category.all().count
        
       Category.all().forEach { category in
//            let url = "https://newsapi.org/v2/top-headlines?category=\(category)&apiKey=92e32945fc184b09a065a64e552270c6"
            print(category)
        //Better way
        WebService().load(Article.by(category)) { articles in
            
            requestCount += 1
            
            guard let articles = articles else {
                return
            }
                
                let category = Category(title:category,articles:articles)
                categories.append(category)
            
            print(requestCount,categoriesCount)
            
            
            if requestCount == categoriesCount {
                DispatchQueue.main.async {
                    completion(categories)
                }
            }
            
        }
        }
        
        
        
    }
}
