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
        ZStack{
            VStack(alignment: .leading){
                HStack(alignment: .top){
                    DownloadImageView(imageUrl: detailViewModel.movieDetails?.poster ?? "...").frame(width: 160, height: 240)
                    VStack(alignment: .leading){
                        Text(detailViewModel.movieDetails?.title ?? "...").font(.title3).foregroundColor(.blue).fixedSize(horizontal: false, vertical: true)
                        IconText(text: detailViewModel.movieDetails?.runtime ?? "...", image: "clock")
                        IconText(text: detailViewModel.movieDetails?.director ?? "...", image: "person")
                        IconText(text: detailViewModel.movieDetails?.genre ?? "...", image: "book").fixedSize(horizontal: false, vertical: true)
                        IconText(text: "IMDB: \(detailViewModel.movieDetails?.imdbRate ?? "...")", image: "star")
                    }.padding().frame(height: 240)
                }
                HStack(alignment: .center){
                    Text(detailViewModel.movieDetails?.released ?? "...").padding(7).background(.blue).font(.subheadline).clipShape(Capsule()).foregroundColor(.white)
                    Text(detailViewModel.movieDetails?.country ?? "...").padding(7).background(.blue).font(.subheadline).clipShape(Capsule()).foregroundColor(.white)
                    Text(detailViewModel.movieDetails?.language ?? "...").padding(7).background(.blue).font(.subheadline).clipShape(Capsule()).foregroundColor(.white)
                }.frame(width: getScreenWidth() * 0.8,height: 40,alignment: .center).padding()
                Text("Actors").font(.title).padding(2)
                Text(detailViewModel.movieDetails?.actors ?? "...")
                Text("Plot").font(.title).padding(2)
                Text(detailViewModel.movieDetails?.plot ?? "...")
                Spacer()

            }.padding()
            if detailViewModel.isLoading{
                LoadingView()
            }
        }.onAppear(perform: {
            self.detailViewModel.getMovieDetails(imdbId: imdbId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt3896198")
    }
}

struct LoadingView: View{
    var body: some View{
        ZStack{
            Color(.white).ignoresSafeArea()
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
        }
    }
}
