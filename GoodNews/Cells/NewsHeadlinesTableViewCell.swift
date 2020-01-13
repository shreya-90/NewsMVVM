//
//  NewsHeadlinesTableViewCell.swift
//  GoodNews
//
//  Created by Shreya on 10/12/19.
//  Copyright © 2019 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

class NewsHeadlinesTableViewCell : UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var headlineImageView : UIImageView!
    
    
    
}



extension NewsHeadlinesTableViewCell {
    func configure(vm: ArticleViewModel){
        self.titleLabel.text = vm.title
        self.descriptionLabel.text = vm.description
        vm.image {
            self.headlineImageView.image = $0
        }
    }
}
