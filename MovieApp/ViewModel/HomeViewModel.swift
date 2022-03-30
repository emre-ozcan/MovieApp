//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject{
    
    
    @Published var movies = [HViewModel]()
    
    let httpClient = HttpClient()
    
    func getSearchMovies(searchString: String){
        httpClient.getSearchMovies(search: searchString) { (result) in
            switch result{
                case.failure(let error): print(error)
                case.success(let movieList):
                if let movieList = movieList{
                    DispatchQueue.main.async {
                        self.movies = movieList.map(HViewModel.init)
                    }
                }
            }
        }
    }
}


struct HViewModel{
    let movie: Movie
    
    var title: String {
        movie.title
    }
    
    var image: String{
        movie.image
    }
    
    var imdbId: String{
        movie.imdbId
    }
    
    var year: String{
        movie.year
    }
}
