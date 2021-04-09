//
//  NewsElements.swift
//  CollectionViewDemo
//
//  Created by Yoonha Kim on 4/7/21.
//

import Foundation

struct NewsElements: Decodable {
    var id: String
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
    var updatedAt: String
}

typealias News = [NewsElements]
