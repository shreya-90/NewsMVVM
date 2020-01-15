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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.newsDetailsVM = NewsDetailsViewModel(article)
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.title =  self.newsDetailsVM.article.sourceName
        
        guard let url = self.newsDetailsVM.url,
            let newsDetailsURL =  URL(string: url) else {
                return
        }
        
        let request = URLRequest(url: newsDetailsURL)
        webview.load(request)
    }
}
