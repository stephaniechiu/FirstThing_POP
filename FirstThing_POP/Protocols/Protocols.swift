//
//  Protocols.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

protocol ViewWithBackground {
    var customBackgroundGradient: UIColor { get }
}

extension ViewWithBackground where Self: UIView {
    func addBackgroundGradeint() -> Void {
        backgroundColor = customBackgroundGradient
    }
}

protocol parseJSON {
    func newsURL() -> URL
}

extension parseJSON where Self: Codable {
    func newsURL() -> URL {
        
    }
}
