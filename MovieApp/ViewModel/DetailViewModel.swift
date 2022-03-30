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
    
    let httpClient = HttpClient()
    
    func getMovieDetails(imdbId: String){
        httpClient.getMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case.failure(let error): print(error)
            case.success(let movieDetail): DispatchQueue.main.async {
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
    
}
