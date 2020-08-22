//
//  NewsModel.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/15/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import Foundation

struct Articles: Codable {
    var articles: [Article]
}

struct Article: Codable {
    var title: String = ""
    var description: String? = ""
    var url: String = ""
    var publishedAt: String = ""
}
