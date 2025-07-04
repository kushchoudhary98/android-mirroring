//
//  Android_MirroringApp.swift
//  Android Mirroring
//
//  Created by Kush Choudhary on 30/06/25.
//

import SwiftUI

@main
struct Android_MirroringApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .defaultSize(width: 500, height: 500)
        .windowResizability(.contentSize)
    }
}
