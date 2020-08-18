//
//  ViewProtocol.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

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
