//
//  StrapiMock.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/25/21.
//

import Foundation

final class StrapiMock<T: Model>: Strapi<Article> {

    override func fetch() {
        let file = Bundle.main.path(forResource: "demo-articles", ofType: "json")!
        let url = URL(fileURLWithPath: file)
        let data = try! Data(contentsOf: url, options: .mappedIfSafe)
        
        let decode = JSONDecoder()
        decode.keyDecodingStrategy = .convertFromSnakeCase
        self.data = try! decode.decode([Article].self, from: data)
    }
}
