//
//  TVSeriesView.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI

struct TVSeriesView: View {
    @EnvironmentObject var vm : HomeViewModel
    
    var body: some View {
        
        ScrollView{
            
            popularMovies
            upcomingMovies
            topRatedMovies
        }
        .navigationBarTitle("The MovieDB")
        
    }
}

struct TVSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TVSeriesView()
            .environmentObject(HomeViewModel())
    }
}


extension TVSeriesView {
    private var popularMovies : some View{
        VStack(alignment:.leading){
            Text("Popular")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(vm.popularTV) {tv in
                        PosterTVViewCell(tv: tv)
                    }
                    
                   
                }
                .padding(.horizontal)
               
            }
            .onAppear{
                vm.fetchTVs(with: "popular")
            }
          
        }
    }
    
    private var  upcomingMovies : some View{
        VStack(alignment:.leading){
            Text("On The Air")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(vm.upcomingTV) {tv in
                        BackdropTVViewCell(tv: tv)
                    }
                    
                   
                }
                .padding(.horizontal)
               
            }
            .onAppear{
                vm.fetchTVs(with: "on_the_air")
            }
          
        }
    }
    private var topRatedMovies : some View{
        VStack(alignment:.leading){
            Text("Top Rated")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(vm.topRatedTV) {tv in
                        BackdropTVViewCell(tv: tv)
                    }
                    
                   
                }
                .padding(.horizontal)
               
            }
            .onAppear{
                vm.fetchTVs(with: "top_rated")
            }
          
        }
    }
}
