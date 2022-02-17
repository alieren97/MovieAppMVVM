//
//  BackdropCarouselView.swift
//  MovieMVVM
//
//  Created by Ali Eren on 17.02.2022.
//

import SwiftUI

struct CarouselView: View {
    let title : String
    let flag : Bool
    let movies : [Movie]
    
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(movies) {movie in
                        
                        NavigationLink(destination: {
                            MovieDetailsView(movieId:movie.id)
                        }, label: {
                            if flag == false {
                                
                                BackdropMovieViewCell(movie: movie)
                            }
                            else{
                                PosterMovieViewCell(movie:movie)
                            }
                            
                            
                        })
                            .foregroundColor(.black)
                    }
                    
                    
                }
                .padding(.horizontal)
                
            }
            
            
        }
    }
}

