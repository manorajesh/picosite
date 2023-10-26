//
//  picositeApp.swift
//  picosite
//
//  Created by Mano Rajesh on 10/25/23.
//

import SwiftUI

@main
struct picositeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 800, minHeight: 600)
        }
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
    }
}
