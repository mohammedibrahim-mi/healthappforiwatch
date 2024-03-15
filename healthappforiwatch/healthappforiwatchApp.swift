//
//  healthappforiwatchApp.swift
//  healthappforiwatch
//
//  Created by Pixel on 05/03/24.
//

import SwiftUI

@main
struct healthappforiwatchApp: App {
    
    
    @StateObject var manager = HealthController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
