//
//  PlaygroundIOSApp.swift
//  PlaygroundIOS
//
//  Created by Prana dhika on 17/05/25.
//

import SwiftUI

@main
struct PlaygroundIOSApp: App {
    // Initialize dependencies
    private let userRepository: UserRepository = MockUserRepository() // Replace with real implementation later
    
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel(userRepository: userRepository))
        }
    }
}
