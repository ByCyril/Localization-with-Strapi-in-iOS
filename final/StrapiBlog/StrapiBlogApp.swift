//
//  StrapiBlogApp.swift
//  StrapiBlog
//
//  Created by Cyril Garcia on 5/25/21.
//

import SwiftUI

@main
struct StrapiBlogApp: App {
    
    @ObservedObject var strapi: Strapi = Strapi<Article>()
    
    var body: some Scene {
        WindowGroup {
            ContentView(strapi: strapi)
        }
    }
}
