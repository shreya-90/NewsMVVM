//
//  NewsHeadlinesTableViewController.swift
//  GoodNews
//
//  Created by Shreya on 10/12/19.
//  Copyright © 2019 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

class NewsHeadlinesTableViewController : UITableViewController{
    
    
//    let news = [["title":"This is the title","description":"This is the description This is the description"],["title":"This is the title","description":"This is the description This is the description This is the description This is the description This is the description This is the description"],["title":"This is the title This is the title This is the title This is the title","description":"This is the description This is the description This is the description This is the description This is the description This is the description This is the description This is the description This is the description This is the description"]]
    
    
    private var categoryListVM : CategoryListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        populateHeadlinesAndArticles()
    }
    
    private func populateHeadlinesAndArticles() {
        
   
        CategoryService().getAllHeadlinesForAllCategories { [weak self] categories in
            self?.categoryListVM =  CategoryListViewModel(categories: categories)
            self?.tableView.reloadData()
            print(categories)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return categoryListVM.heightForHeaderInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title:name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberOfSections
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSection(section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "NewsHeadlinesTableViewCell", for: indexPath) as? NewsHeadlinesTableViewCell else {
            fatalError("NewsHeadlinesTableViewCell not found")
        }
        
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(indexPath.row)
        
        cell.configure(vm:articleVM)
        
        return cell
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.tableHeaderView = UIView.viewForTableViewHeader(subtitle: Date.dateAsStringForTableViewHeader())
        
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.news.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlinesTableViewCell", for: indexPath) as? NewsHeadlinesTableViewCell
//            else {
//                fatalError("NewsHeadlinesTableViewCell not found")
//            }
//
//        cell.titleLabel.text = news[indexPath.row]["title"]
//        cell.descriptionLabel.text = news[indexPath.row]["description"]
//
//        return cell
//    }
}
