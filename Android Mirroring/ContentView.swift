//
//  ContentView.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = "Home"
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                NavigationLink(value: "Home"){
                    Text("Home")
                        .font(.title2)
                }
                NavigationLink(value: "Settings"){
                    Text("Settings")
                        .font(.title2)
                }
                NavigationLink(value: "About"){
                    Text("About")
                        .font(.title2)
                }
            }
            .frame(width: 200)
        } detail: {
            if let selection = selection {
                switch selection {
                case "Home":
                    HomeView()
//                case "Settings":
//                    SettingsView()
                default:
                    Text("Unknown")
                }
            } else {
                Text("Select an item")
            }
        }
    }
}
#Preview {
    ContentView()
}
