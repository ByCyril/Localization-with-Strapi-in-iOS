//
//  ContentView.swift
//  StrapiBlog
//
//  Created by Cyril Garcia on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var strapi: Strapi<Article>
    
    var body: some View {
        NavigationView {
            List(strapi.data) { article in
                Text(article.title)
            }.navigationTitle("Strapi Blog")
            .modifier(ToolbarView())
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(strapi: StrapiMock<Article>())
    }
}
