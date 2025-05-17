import Foundation
import SwiftUI

@MainActor
class SplashViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var error: AppError?
    @Published var showError: Bool = false
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func checkUserSession() async {
        do {
            // Simulate checking user session
            try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds delay
            
            // Try to get user with ID "1" as a test
            _ = try await userRepository.getUser(id: "1")
            
            isLoading = false
        } catch {
            let appError = ErrorHandler.handle(error)
            self.error = appError
            self.showError = true
            ErrorHandler.log(error)
            isLoading = false
        }
    }
    
    func dismissError() {
        showError = false
        error = nil
    }
} 