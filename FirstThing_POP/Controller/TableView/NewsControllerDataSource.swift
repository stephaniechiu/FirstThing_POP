//
//  NewsControllerDataSource.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/18/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension NewsController {
    
    //MARK: - TableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.titleCellID, for: indexPath)
        let articleTitle = articles[indexPath.row]
        cell.textLabel?.text = articleTitle.title
        return cell
    }
}
