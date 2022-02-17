//
//  TrendingMovieCell.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI
import Kingfisher
struct PosterMovieViewCell: View {
    let movie : Movie
    var body: some View {
        VStack{
            KFImage(URL(string: movie.posterURL.absoluteString))
                .resizable()
                .frame(width: 175, height: 270)
                .cornerRadius(10)
            
            Text(movie.title)
                .padding(.vertical)
                .font(.system(size:12,weight: .bold))
            
        }
        .frame(width: 170)
        .cornerRadius(10)
        
        
    }
}

struct PosterMovieViewCell_Previews: PreviewProvider {
    static var previews: some View {
        PosterMovieViewCell(movie: dev.movie)
            .previewLayout(.sizeThatFits)
        
    }
}
