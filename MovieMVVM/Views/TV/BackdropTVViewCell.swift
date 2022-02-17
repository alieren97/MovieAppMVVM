//
//  BackdropTVViewCell.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import SwiftUI
import Kingfisher

struct BackdropTVViewCell: View {
    let tv: TV
    var body: some View {
        VStack{
            KFImage(URL(string: tv.backdropURL.absoluteString))
                .resizable()
                .frame(width: 250, height: 150)
                .cornerRadius(10)
            
            Text(tv.name)
                .padding(.vertical)
                .font(.system(size:12,weight: .bold))
                
        }
        .frame(width: 250)
        .cornerRadius(10)
    }
}
