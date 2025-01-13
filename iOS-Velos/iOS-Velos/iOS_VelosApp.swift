//
//  iOS_VelosApp.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/11/25.
//

import SwiftUI

@main
struct iOS_VelosApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabView {
                    HomeView(viewModel: HomeViewModel())
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .toolbar(content: {
                            Button {
                                print("wow")
                            } label: {
                                Image(systemName: "arrow.counterclockwise")
                            }

                        })

                    FeedView()
                        .tabItem {
                            Image(systemName: "list.bullet.rectangle")
                        }
                        .background(Color(red: 240/255, green: 240/255, blue: 240/255))

                    Text("my")
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
                .accentColor(.black)
            }
        }
    }

    init() {
        UITabBar.appearance().backgroundColor = .white
    }
}
