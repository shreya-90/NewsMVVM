//
//  NewsDetailsViewModel.swift
//  GoodNews
//
//  Created by Shreya on 13/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


struct NewsDetailsViewModel {
    let article : Article
}

extension NewsDetailsViewModel {
    
    init(_ article:Article){
        self.article = article
    }
}

extension NewsDetailsViewModel {
    var sourceName: String {
        return "sourcename"
    }
    
    var url:String? {
        return self.article.url
    }
}
