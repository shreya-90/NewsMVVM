//
//  ThemeManager.swift
//  GoodNews
//
//  Created by Shreya on 10/12/19.
//  Copyright © 2019 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager{
    static func setup(){
        UINavigationBar.appearance().barTintColor = UIColor.blue
        
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
           UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
}
