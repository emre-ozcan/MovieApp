//
//  DetailView.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import SwiftUI

struct DetailView: View {
    let imdbId: String
    
    @ObservedObject var detailViewModel = DetailViewModel()
    
    var body: some View {
        VStack{
            DownloadImageView(imageUrl: detailViewModel.movieDetails?.poster ?? "...").frame(width: 100, height: 150)
            Text(detailViewModel.movieDetails?.title ?? "...")
        }.onAppear(perform: {
            self.detailViewModel.getMovieDetails(imdbId: imdbId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
