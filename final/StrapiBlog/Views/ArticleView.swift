//
//  ArticleView.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/25/21.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Article
    
    var body: some View {
        TextView(text: article.content).padding(.top).navigationTitle(article.title)
    }
}
