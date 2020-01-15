//
//  Article.swift
//  GoodNews
//
//  Created by Shreya on 07/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

struct NewsSourcesResponse : Decodable  {
    let articles : [Article]
}

struct Article:Decodable{
    let title  : String
    let description : String?
    let url : String?
    let imageURL : String?
    let sourceName : String
   
    
//    private enum CodingKeys : String, CodingKey {
//        case title
//        case description
//        case url
//        case imageURL = "urlToImage"
//
//    }
    
    private enum ArticleKeys : String, CodingKey {
        case title
        case description
        case url
        case imageURL = "urlToImage"
        case source
        
    }
    
    private enum SourceKeys : String, CodingKey {
        case name
    }
    
    init(from decoder :  Decoder) throws{           //no nested hierarcy inside Article model by using this by using source object
        
        let container = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.url = try? container.decode(String.self, forKey: .url)
        self.imageURL = try? container.decode(String.self, forKey: .imageURL)
        
        let sourceContainer = try container.nestedContainer(keyedBy: SourceKeys.self, forKey: .source)
        self.sourceName = try sourceContainer.decode(String.self, forKey: .name)
    }
}


extension Article {
    static func by(_ category:String) -> Resource<[Article]> {   //this is going to give us the resource ... Article.
        
        return Resource<[Article]>(url: URL.urlForTopHeadlines(for: category)) { data in
            return try! JSONDecoder().decode(NewsSourcesResponse.self, from: data).articles
        }
    }
    
    
}


