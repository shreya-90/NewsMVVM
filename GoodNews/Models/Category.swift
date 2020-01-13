//
//  Category.swift
//  GoodNews
//
//  Created by Shreya on 07/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
struct Category{
    
    let title  : String
    let articles : [Article]
    
    static func all() -> [String] {
        return ["Business","Entertainment","General","Sports"]
    }
}
