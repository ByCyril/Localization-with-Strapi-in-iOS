//
//  ContentCellView.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/23/21.
//

import SwiftUI

struct ContentCellView: View {
    
    var title: String
    var content: String
    var publishedDate: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Text(title).font(.title)
            Text(content).font(.body)
                .lineLimit(3)
            HStack {
                Spacer()
                Text(publishedDate.toDate()).font(.caption)
            }.padding(.top)
        })
    }

}

struct ContentCellView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCellView(title: "Hello, World",
                        content: "this is a sample body",
                        publishedDate: "date")
    }
}

