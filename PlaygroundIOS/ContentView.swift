import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashView(viewModel: SplashViewModel(userRepository: MockUserRepository()))
    }
}

#Preview {
    ContentView()
}
