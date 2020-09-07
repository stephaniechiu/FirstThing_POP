//
//  NewsControllerExtension.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/16/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension NewsController: NetworkServiceDelegate {
    func requestSucceeded() {
        print("success")
    }
    
    func requestFailed() {
        print("failed")
    }
    
    
}
