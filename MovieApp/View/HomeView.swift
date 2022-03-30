//
//  ContentView.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(){
        self.homeViewModel = HomeViewModel()
        self.homeViewModel.getSearchMovies(searchString: "batman")
    }
    
    var body: some View {
        List(homeViewModel.movies, id: \.imdbId){ movie in
            Text(movie.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
