//
//  HttpClient.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import Foundation

class HttpClient{
    
    func getSearchMovies(search: String, completion: @escaping (Result<[Movie]?, HttpError>) -> Void){
        
        guard let url = URL(string: "\(Constants.BASE_URL)?s=\(search)&apikey=\(Constants.API_KEY)")
            else{
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.anyData))
            }
            guard let searchMoviesResponse = try? JSONDecoder().decode(MovieList.self, from: data) else{
                return completion(.failure(.dataNotProcessed))
            }
            
            completion(.success(searchMoviesResponse.movies))
        }.resume()
    }
    
    func getMovieDetails(imdbId: String, completion: @escaping(Result<MovieDetail,HttpError>) -> Void){
        
        guard let url = URL(string: "\(Constants.BASE_URL)?i=\(imdbId)&apikey=\(Constants.API_KEY)")else{
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.anyData))
            }
            
            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else{
                return completion(.failure(.dataNotProcessed))
            }
            
            completion(.success(movieDetailResponse))

        }.resume()
    }
}

enum HttpError: Error{
    case wrongUrl
    case anyData
    case dataNotProcessed
}
