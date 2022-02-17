//
//  MovieDetailsView.swift
//  MovieMVVM
//
//  Created by Ali Eren on 16.02.2022.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @State private var showFullDescription: Bool = false
    @EnvironmentObject var vm : HomeViewModel
    //var vm : HomeViewModel
    
    let movieId: Int
    
    
    
    var body: some View {
        
        ScrollView{
            if let movie = vm.movieDetail {
                
                ZStack(alignment:.bottomLeading){
                    KFImage(URL(string: movie.backdropURL.absoluteString ))
                    
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                    
                    Text(movie.title )
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
                HStack{
                    Text(movie.tagline)
                        .font(.title2)
                    
                    
                }
                .padding()
                VStack(alignment:.leading){
                    Text("Overview")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    ZStack {
                        VStack(alignment: .leading) {
                            Text(movie.overview ?? "")
                                .lineLimit(showFullDescription ? nil : 2)
                                .font(.callout)
                                .foregroundColor(.black)
                            
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    showFullDescription.toggle()
                                }
                            }, label: {
                                Text(showFullDescription ? "Less" : "Read more..")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 4)
                            })
                                .accentColor(.blue)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            
            vm.fetchMovie(id: self.movieId)
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(false)
        
    }
    
}





struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MovieDetailsView(movieId: dev.movie.id)
        }
        .environmentObject(HomeViewModel())
        
    }
}
