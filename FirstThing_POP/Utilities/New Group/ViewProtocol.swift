//
//  ViewProtocol.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

/*
Outline for what the view in each viewController (News, Category) needs to adhere to
 */

import UIKit

protocol ViewLayoutDelegate: class {
    var viewBackgroundColor: UIColor { get }
    var titleLabel: UILabel { get }
    
    func setupViewLayout()
}

extension ViewLayoutDelegate where Self: UIView {
    func addBackground() -> Void {
        backgroundColor = viewBackgroundColor
    }
}
