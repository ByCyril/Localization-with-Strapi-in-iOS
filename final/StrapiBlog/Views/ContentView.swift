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
                NavigationLink(
                    destination: ArticleView(article: article),
                    label: {
                        ContentCellView(title: article.title, content: article.content, publishedDate: article.publishedAt)
                    })
            }.navigationTitle("Strapi Blog")
            .modifier(ToolbarView())
        }.onAppear(perform: loadContent)
    }
    
    func loadContent() {
        let supportedLocalization = strapi.supportedLocalization
        let preferredLocale = Bundle.preferredLocalizations(from: supportedLocalization)
        
        let locale = preferredLocale.first!.components(separatedBy: "-").first!
        
        strapi.contentType(.articles).locale(locale).fetch()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(strapi: StrapiMock<Article>())
    }
}
