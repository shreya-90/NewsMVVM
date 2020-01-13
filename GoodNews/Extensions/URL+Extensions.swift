//
//  URL+Extensions.swift
//  GoodNews
//
//  Created by Shreya on 08/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForTopHeadlines(for category: String) -> URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?category=\(category)&country=us&apiKey=0cf790498275413a9247f8b94b3843fd")!
    }
}
