//
//  PreviewProvider.swift
//
//
//  Created by Ali Eren on 3.02.2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev : DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    
    private init(){
        
    }
    
    let movie = Movie(
        adult: false,
        backdropPath: "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
        genreIDS: [
            28,
            12,
            878
          ],
        id: 634649,
        originalLanguage: "en",
        originalTitle: "Spider-Man: No Way Home",
        overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
        popularity: 9461.956,
        posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
        releaseDate: "2021-12-15",
        title: "Spider-Man: No Way Home",
        video: false,
        voteAverage: 8.5,
        voteCount: 7755)
    
    
   
    
    
   
      
      
}
