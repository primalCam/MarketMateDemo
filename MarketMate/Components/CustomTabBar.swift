import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    selectedTab = .home
                }) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == .home ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    showModal = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .offset(y: -24)
                .sheet(isPresented: $showModal) {
                    AddListView(viewModel: GroceryViewModel())
                }
                
                Button(action: {
                    selectedTab = .list
                }) {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == .list ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 60)
            .background(Color.white.shadow(radius: 2))
            .ignoresSafeArea() // Ensure the tab bar ignores the safe area
        }
    }
}

enum Tab {
    case home
    case list
}
