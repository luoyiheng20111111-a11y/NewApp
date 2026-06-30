import SwiftUI

struct WelcomePage: View {
    @Binding var isActive: Int
    let targetPage: Int
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image(systemName: "fork.knife.circle")
                    .font(.system(size: 80))
                    .foregroundColor(Color(red: 0.581, green: 0.812, blue: 0.491))
                
                Spacer()
                
                Text("International food")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = targetPage
            }
        }
    }
}

struct LoadingPage: View {
    @Binding var isActive: Int
    let targetPage: Int
    @State private var progress = 0.0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image(systemName: "fork.knife.circle")
                    .font(.system(size: 60))
                    .foregroundColor(Color(red: 0.581, green: 0.812, blue: 0.491))
                
                Spacer()
                
                Text("Loading")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
                
                ProgressView(value: progress)
                    .frame(width: 200)
                    .tint(Color(red: 0.581, green: 0.812, blue: 0.491))
                
                Spacer()
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2)) {
                progress = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = targetPage
            }
        }
    }
}

struct MainPage: View {
    @Binding var isActive: Int
    let targetPage: Int
    
    var body: some View {
        ZStack {
            Color(red: 0.581, green: 0.812, blue: 0.491)
                .edgesIgnoringSafeArea(.all)
            
            Image(systemName: "lettuce")
                .font(.system(size: 120))
                .foregroundColor(.white.opacity(0.3))
                .position(x: 50, y: 700)
            
            Image(systemName: "carrot")
                .font(.system(size: 80))
                .foregroundColor(.white.opacity(0.2))
                .position(x: 350, y: 200)
            
            VStack {
                Spacer()
                
                Image(systemName: "fork.knife.circle")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    isActive = targetPage
                }) {
                    Text("开始")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Text("无障碍")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                
                Spacer()
            }
        }
    }
}

struct IndexPage: View {
    @State private var inputText = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.581, green: 0.812, blue: 0.491)
                .edgesIgnoringSafeArea(.all)
            
            Image(systemName: "lettuce")
                .font(.system(size: 100))
                .foregroundColor(.white.opacity(0.2))
                .position(x: 350, y: 800)
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("Index")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                
                HStack(spacing: 15) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    VStack(spacing: 5) {
                        ForEach(0..<3) { _ in
                            Image(systemName: "star.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding(.leading, 30)
                
                Spacer()
                
                TextField("", text: $inputText)
                    .frame(width: 340, height: 80)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .font(.title)
                
                Spacer()
                
                Button(action: {}) {
                    Text("GO")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomePage(isActive: .constant(0), targetPage: 1)
            LoadingPage(isActive: .constant(1), targetPage: 2)
            MainPage(isActive: .constant(2), targetPage: 3)
            IndexPage()
        }
    }
}
