//
//  Date+Extensions.swift
//  GoodNews
//
//  Created by Shreya on 13/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


extension Date {
    
    
    
    static func dateAsStringForTableViewHeader() -> String {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: Date())
        
    }
}
