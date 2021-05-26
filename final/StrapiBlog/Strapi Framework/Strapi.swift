//
//  Strapi.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/23/21.
//

import Foundation

enum ContentType: String {
    case articles
    case localizations
}

class Strapi<T: Model>: StrapiCore<T> {
    
    func contentType(_ type: ContentType) -> Strapi {
        url += "/" + type.rawValue
        return self
    }

    func locale(_ type: String) -> Strapi {
        url += "?_locale=\(type)"
        return self
    }
    
}
