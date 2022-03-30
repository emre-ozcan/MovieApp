//
//  ContentView.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var searchString = ""
    
    init(){
        self.homeViewModel = HomeViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Search Here...", text: $searchString, onCommit: {
                    self.homeViewModel.getSearchMovies(searchString: searchString.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed) ?? searchString)
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(homeViewModel.movies, id: \.imdbId){ movie in
                    NavigationLink(destination: DetailView(imdbId: movie.imdbId)) {
                        HStack{
                            DownloadImageView(imageUrl: movie.image)
                            VStack(alignment: .leading){
                                Text(movie.title).font(.title3).foregroundColor(.blue)
                                Text(movie.year).foregroundColor(.gray)
                            }.padding()
                        }.padding()
                    }
                }
            }
            .navigationTitle(Text("Movies"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
