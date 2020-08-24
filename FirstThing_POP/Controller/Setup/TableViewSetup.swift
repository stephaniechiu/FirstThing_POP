//
//  TableViewSetup.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/23/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class TableViewSetup {
    
    let newsTableView = UITableView()
    
    func tableView() {
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Cell.titleCellID)
        newsTableView.estimatedRowHeight = 70
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.separatorStyle = .none
    }
}
