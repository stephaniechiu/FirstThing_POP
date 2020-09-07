//
//  NewsModel.swift
//  FirstThingPOP
//
//  Created by Stephanie on 8/15/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import Foundation

/*
 JSON Data is decoded from News API, newsapi.org
 */

struct Articles: Codable {
    var articles: [Article]
}

struct Article: Codable {
    var title: String = ""
    var description: String? = ""
    var url: String = ""
    var publishedAt: String = ""
}
