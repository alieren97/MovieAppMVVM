//
//  HomeView.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm : HomeViewModel
    
    var body: some View {
        
        ScrollView{
            nowPlaying
            popularMovies
            upcomingMovies
            topRatedMovies
        }
        
        
        .navigationBarTitle("The MovieDB")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
        .environmentObject(HomeViewModel())
        
    }
}



extension HomeView {
    private var nowPlaying : some View{
        
        CarouselView(title: "Now Playing",flag:true,movies: vm.nowPlayingMovies)
            .onAppear{
                vm.fetchMovies(with: "now_playing")
            }
        
    }
    
    private var popularMovies : some View{
        CarouselView(title: "Popular",flag:false,movies: vm.popularMovies)
            .onAppear{
                vm.fetchMovies(with: "popular")
            }
    }
    
    private var  upcomingMovies : some View{
        CarouselView(title: "Upcoming",flag:false,movies: vm.upcomingMovies)
            .onAppear{
                vm.fetchMovies(with: "upcoming")
            }
    }
    private var topRatedMovies : some View{
        CarouselView(title: "Top Rated",flag:false,movies: vm.topRatedMovies)
            .onAppear{
                vm.fetchMovies(with: "top_rated")
            }
    }
}
