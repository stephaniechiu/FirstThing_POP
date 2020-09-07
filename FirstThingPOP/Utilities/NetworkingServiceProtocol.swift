//
//  Protocols.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

protocol NetworkServiceDelegate: class {
    func requestFailed()
    func requestSucceeded()
}
