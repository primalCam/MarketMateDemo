import SwiftUI

struct homeView: View {
    @State private var showModal = false
    @State private var searchQuery = ""
    @State private var selectedTab: Tab = .home
    @StateObject private var viewModel = GroceryViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if selectedTab == .home {
                    VStack {
                        NavigationStack() {
                            TabView {
                                ForEach(0..<5) { index in
                                    VStack {
                                        Image(systemName: "house")
                                            .padding()
                                        Text("Add Items")
                                            .font(.subheadline)
                                            .padding()
                                        Spacer()
                                    }
                                    .frame(width: 150, height: 150)
                                    .background(RoundedRectangle(cornerRadius: 30)
                                        .opacity(0.2))
                                }
                            }
                            .frame(width: .infinity, height: 230)
                            .background(.pink.opacity(0.2))
                            .tabViewStyle(PageTabViewStyle())
                            
                            VStack {
                                TextField("Search your groups...", text: $searchQuery)
                                    .fontWeight(.bold)
                                    .padding()
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                List {
                                    ForEach(filteredItems) { list in
                                        NavigationLink(destination: GroceryListView(list: list)) {
                                            Text(list.name)
                                        }
                                    }
                                    .onDelete { indices in
                                        viewModel.groceryLists.remove(atOffsets: indices)
                                    }
                                }
                                .toolbar {
                                    ToolbarItem(placement: .topBarLeading) {
                                        NavigationLink(destination: profileView()) {
                                            Text("Profile View")
                                        }
                                    }
                                    ToolbarItem(placement: .topBarTrailing) {
                                        NavigationLink(destination: AddListView(viewModel: viewModel)) {
                                            Text("Add New List")
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                } else if selectedTab == .list {
                    ListView() // This would be another view you define for the list tab
                }
                
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)

            }
            .ignoresSafeArea(edges: .bottom) // Ensure the entire VStack ignores the safe area at the bottom
            
        }
        
    }
    
    var filteredItems: [GroceryList] {
        if searchQuery.isEmpty {
            return viewModel.groceryLists
        } else {
            return viewModel.groceryLists.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}

struct ListView: View {
    var body: some View {
        Text("List View Content") // Replace with your actual list view content
    }
}

#Preview {
    homeView()
}

