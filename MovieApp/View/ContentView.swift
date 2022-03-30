//
//  ContentView.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            HttpClient().getSearchMovies(search: "batman") { (response) in
                switch response{
                case .success(let movieList): print(movieList)
                case .failure(let error): print(error)
                }
            }
        }, label: {
            Text("Request Call")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
