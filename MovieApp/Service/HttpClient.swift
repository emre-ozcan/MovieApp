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
}

enum HttpError: Error{
    case wrongUrl
    case anyData
    case dataNotProcessed
}
