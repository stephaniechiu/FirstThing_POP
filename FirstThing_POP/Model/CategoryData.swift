//
//  CategoryData.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import Foundation

extension CategoryController {
    
    func fetchCategoryURL() -> [Category] {
        let topHeadlines = Category(category: "#TopHeadlines", categoryURL: "https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        let technology = Category(category: "#Technology", categoryURL: "https://newsapi.org/v2/top-headlines?q=technology&pageSize=10&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        let health = Category(category: "#Health", categoryURL: "https://newsapi.org/v2/top-headlines?q=health&pageSize=10&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        let business = Category(category: "#Business", categoryURL: "https://newsapi.org/v2/top-headlines?q=business&pageSize=10&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        let entertainment = Category(category: "#Entertainment", categoryURL: "https://newsapi.org/v2/top-headlines?q=entertainment&pageSize=10&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        let sports = Category(category: "#Sports", categoryURL: "https://newsapi.org/v2/top-headlines?q=sports&pageSize=10&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        
        return[topHeadlines, technology, health, business, entertainment, sports]
    }
}
