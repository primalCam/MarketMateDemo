//
//  homeView.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/16/24.
//

import SwiftUI

struct homeView: View {
    @State private var showModal = false
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationStack() {
                    Button("New Task") {
                        showModal = true
                    }
                    .font(.title)
                    .fontWeight(.bold)
                    .sheet(isPresented: $showModal, content: {
                        homeChildView()
                    })
                    
                    ZStack {
                        ScrollView(.horizontal) {
                            HStack {
                                VStack{
                                    Image(systemName: "house")
                                        .padding()
                                    NavigationLink(destination: homeChildView()) {
                                        Text("Card 1")
                                            .font(.subheadline)
                                    }
                                }
                                .frame(width: 150, height: 150)
                                .background(RoundedRectangle(cornerRadius: 30).opacity(0.3))
                                
                                VStack{
                                    Image(systemName: "gear")
                                        .padding()
                                    NavigationLink(destination: homeChildView()) {
                                        Text("Card 2")
                                            .font(.subheadline)
                                    }

                                }
                                .frame(width: 150, height: 150)
                                .background(RoundedRectangle(cornerRadius: 30).opacity(0.3))
                                
                                VStack{
                                    Image(systemName: "person")
                                        .padding()
                                    NavigationLink(destination: homeChildView()) {
                                        Text("Card 3")
                                            .font(.subheadline)
                                    }

                                }
                                .frame(width: 150, height: 150)
                                .background(RoundedRectangle(cornerRadius: 30).opacity(0.3))
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    
                    VStack{
                        TextField("Search your groups..", text: $searchQuery)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        List() {
                            NavigationLink(destination: homeChildView()) {
                                Label("Group 1", systemImage: "carrot")
                                    .fontDesign(.monospaced)
                            }
                            NavigationLink(destination: homeChildView()){
                                Label("Group 2", systemImage: "carrot")
                                    .fontDesign(.monospaced)
                            }
                            NavigationLink(destination: homeChildView()) {
                                Label("Group 3", systemImage: "carrot")
                                    .fontDesign(.monospaced)
                            }
                        }
                    }
                    
                    
                }
                
            }
        }
    }
}

#Preview {
    homeView()
}
