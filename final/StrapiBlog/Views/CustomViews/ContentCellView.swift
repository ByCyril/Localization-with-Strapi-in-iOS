//
//  ContentCellView.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/23/21.
//

import SwiftUI

struct ContentCellView: View {
    
    var article: Article
    
    init(_ article: Article) {
        self.article = article
    }

    var body: some View {
        NavigationLink(
            destination: ArticleView(article: article),
            label: {
                VStack(alignment: .leading, spacing: nil, content: {
                    Text(article.title).font(.title)
                    Text(article.content).font(.body)
                        .lineLimit(3)
                    HStack {
                        Spacer()
                        Text(article.publishedAt.toDate()).font(.caption)
                    }.padding(.top)
                })
                
            })
    }

}

struct ContentCellView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCellView(Article(id: 1, title: "Hello, World", content: "This is a sample body", locale: "en", publishedAt: "somedate"))
    }
}

