//
//  cadel_swiftuiApp.swift
//  cadel-swiftui
//
//  Created by Hafizh Mo on 23/01/23.
//

import SwiftUI

@main
struct cadel_swiftuiApp: App {
    @StateObject var dm = CadelViewModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
