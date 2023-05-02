//
//  BigTechApp.swift
//  BigTech
//
//  Created by SERGEI on 29.03.2023.
//

import SwiftUI

@main
struct BigTechApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }

    }
}
