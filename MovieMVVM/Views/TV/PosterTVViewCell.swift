//
//  TVPosterViewCell.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI
import Kingfisher

struct PosterTVViewCell: View {
    let tv : TV
    var body: some View {
        VStack{
            KFImage(URL(string: tv.posterURL.absoluteString))
                .resizable()
                .frame(width: 175, height: 270)
                .cornerRadius(10)
            
            Text(tv.name)
                .padding(.vertical)
                .font(.system(size:12,weight: .bold))
                
        }
        .frame(width: 170)
        .cornerRadius(10)
    }
}
