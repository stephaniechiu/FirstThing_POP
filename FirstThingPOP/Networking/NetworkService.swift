//
//  NetworkService.swift
//  FirstThingPOP
//
//  Created by Stephanie on 8/16/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class NetworkService {
    
    func getNewsArticlesByURL(url: String) -> [Article] {
        var jsonArticles = [Article]()
        
        if let APIurl = URL(string: url) {

            if let data = try? Data(contentsOf: APIurl) {
                let decoder = JSONDecoder()

                if let JSONArticles = try? decoder.decode(Articles.self, from: data) {
                    jsonArticles = JSONArticles.articles
//                    print("----------\(jsonArticles)----------")
                }
            }

            else {
                print("Error")
            }
        }
        return jsonArticles
    }
}
