//
//  TextView.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/25/21.
//
    
import SwiftUI
 
struct TextView: UIViewRepresentable {
 
    var text: String
 
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
 
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
