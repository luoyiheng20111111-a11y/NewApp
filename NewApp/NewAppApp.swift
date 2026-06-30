import SwiftUI

@main
struct NewAppApp: App {
    @State private var currentPage = 0
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                WelcomePage(isActive: $currentPage, targetPage: 1)
                    .opacity(currentPage == 0 ? 1 : 0)
                
                LoadingPage(isActive: $currentPage, targetPage: 2)
                    .opacity(currentPage == 1 ? 1 : 0)
                
                MainPage(isActive: $currentPage, targetPage: 3)
                    .opacity(currentPage == 2 ? 1 : 0)
                
                IndexPage()
                    .opacity(currentPage == 3 ? 1 : 0)
            }
            .ignoresSafeArea()
        }
    }
}
