//
//  BackdropMovieViewCell.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI
import Kingfisher

struct BackdropMovieViewCell: View {
    let movie: Movie
    var body: some View {
        VStack{
            KFImage(URL(string: movie.backdropURL.absoluteString))
                .resizable()
                .frame(width: 250, height: 150)
                .cornerRadius(10)
            
            Text(movie.title)
                .padding(.vertical)
                .font(.system(size:12,weight: .bold))
            
        }
        .frame(width: 250)
        .cornerRadius(10)
    }
}

struct BackdropMovieViewCell_Previews: PreviewProvider {
    static var previews: some View {
        
        BackdropMovieViewCell(movie: dev.movie)
            .previewLayout(.sizeThatFits)
    }
}
