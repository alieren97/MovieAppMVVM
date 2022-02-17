//
//  MovieMVVMApp.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI

@main
struct MovieMVVMApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView{
                    HomeView()
                    
                }
                .tabItem {
                    Label("Movie", systemImage: "film")
                }
                .environmentObject(vm)
                
                NavigationView{
                    TVSeriesView()
                }
                .tabItem {
                    Label("TV", systemImage: "tv")
                }
                .environmentObject(vm)
            }
            
            
        }
    }
}
