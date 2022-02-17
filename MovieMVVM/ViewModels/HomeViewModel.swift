//
//  HomeViewModel.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel :ObservableObject{
    @Published var nowPlayingMovies : [Movie] = []
    @Published var popularMovies : [Movie] = []
    @Published var upcomingMovies : [Movie] = []
    @Published var topRatedMovies : [Movie] = []
    
    
    @Published var nowPlayingTV : [TV] = []
    @Published var popularTV : [TV] = []
    @Published var upcomingTV : [TV] = []
    @Published var topRatedTV : [TV] = []
    
    @Published var movieDetail : MovieDetail?
    
    
    let API_KEY = "b29ebab34c54acad2bbc3d0ff614f09e"
    
    func fetchMovies(with endpoint : String){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint)?api_key=\(API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, err in
            guard let data = data, err == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    if endpoint == "now_playing" {
                        
                        self?.nowPlayingMovies = response.results
                        
                    }
                    if endpoint == "popular" {
                        self?.popularMovies = response.results
                    }
                    if endpoint == "upcoming" {
                        self?.upcomingMovies = response.results
                    }
                    
                    if endpoint == "top_rated" {
                        self?.topRatedMovies = response.results
                    }
                }
                
            } catch  {
                print(err)
            }
            
        }
        task.resume()
    }
    
    func fetchMovie(id : Int){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(API_KEY)&language=en-US") else {return}
        print(url)
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, err in
            guard let data = data, err == nil else {
                return
            }
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                let response = try JSONDecoder().decode(MovieDetail.self, from: data)
                
                DispatchQueue.main.async {
                    
                    self?.movieDetail = response
                    
                    
                }
                
            } catch  {
                print(err)
            }
            
        }
        task.resume()
    }
    
    func fetchTVs(with endpoint : String){
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/\(endpoint)?api_key=\(API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, err in
            guard let data = data, err == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(TvResponse.self, from: data)
                DispatchQueue.main.async {
                    
                    if endpoint == "popular" {
                        self?.popularTV = response.results
                    }
                    if endpoint == "on_the_air" {
                        self?.upcomingTV = response.results
                    }
                    
                    if endpoint == "top_rated" {
                        self?.topRatedTV = response.results
                    }
                }
                
            } catch  {
                print(err?.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    
}
