//
//  NewsDetailsViewController.swift
//  GoodNews
//
//  Created by Shreya on 13/01/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

import WebKit


class NewsDetailsViewController:UIViewController {
    var article : Article!
    private var newsDetailsVM:NewsDetailsViewModel!
    
    @IBOutlet weak var webview : WKWebView!
   
    
}
