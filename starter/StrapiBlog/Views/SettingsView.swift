//
//  SettingsView.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/25/21.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
            List {
                HStack {
                    Image(systemName: "globe")
                    Button(action: {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    }, label: {
                        Text("Language Preference").foregroundColor(.primary)
                    })
                    Spacer()
                    Image(systemName: "chevron.forward").foregroundColor(.secondary)
                }
            }.listStyle(InsetGroupedListStyle()).navigationTitle(Text("Settings"))
        
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
