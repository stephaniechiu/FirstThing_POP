//
//  ControllerProtocol.swift
//  FirstThingPOP
//
//  Created by Stephanie on 8/18/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

/*
Outline for what the controller in each viewController (News, Category) needs to adhere to. Each has a specific navigation controller and view layout
 */

import UIKit

protocol ControllerDelegate: class {
    
    func setupNavigationController()
    func setupLayout()
}
