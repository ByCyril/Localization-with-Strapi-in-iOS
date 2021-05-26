//
//  ToolbarView.swift
//  StrapiBlog
//
//  Created by Cyril Garcia on 5/25/21.
//

import SwiftUI

struct ToolbarView: ViewModifier {
    func body(content: Content) -> some View {
        content.toolbar(content: {
            NavigationLink(
                destination: SettingsView(),
                label: {
                    Image(systemName: "gear")
                })
        })
    }
}
