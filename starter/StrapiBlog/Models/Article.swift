//
//  Article.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/23/21.
//

import Foundation

protocol Model: Decodable {
    var id: Int { get set }
}

struct Article: Identifiable, Model {
    var id: Int
    var title: String
    var content: String
    var locale: String
    var publishedAt: String
}
