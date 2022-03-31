//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject{
    
    @Published var movieDetails : MDViewModel?
    @Published var isLoading = true
    
    let httpClient = HttpClient()
    
    func getMovieDetails(imdbId: String){
        self.isLoading = true
        httpClient.getMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case.failure(let error): print(error)
            case.success(let movieDetail): DispatchQueue.main.async {
                self.isLoading = false
                self.movieDetails = MDViewModel(detail: movieDetail)
                }
            }
        }
    }
}

struct MDViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
    
    var imdbRate : String{
        detail.imdbRating
    }
    
    var genre: String{
        detail.genre
    }
    
    var runtime: String{
        detail.runtime
    }
    
    var country: String{
        detail.country
    }
    
    var rated: String{
        detail.rated
    }
    
    var language: String{
        detail.language
    }
    
    var released: String{
        detail.released
    }
    
    var actors: String{
        detail.actors
    }
}
