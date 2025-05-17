import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        Color("AccentColor"),
                        Color("PrimaryColor"),
                    ], startPoint: .top, endPoint: .bottom)
                )
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                Image("img_logo_app")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.bottom, 24)
                
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
        .task {
            await viewModel.checkUserSession()
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK") {
                viewModel.dismissError()
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "An unknown error occurred")
        }
    }
}

#Preview {
    // Create a mock repository for preview
    let mockRepository = MockUserRepository()
    let viewModel = SplashViewModel(userRepository: mockRepository)
    SplashView(viewModel: viewModel)
} 
