//
//  DownloadImageView.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import SwiftUI

struct DownloadImageView: View {
    @ObservedObject var imageDownloaderViewModel: ImageDownloaderViewModel
    let url: String
    
    init(imageUrl: String){
        self.url = imageUrl
        imageDownloaderViewModel = ImageDownloaderViewModel()
        imageDownloaderViewModel.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderViewModel.downloadedImage{
            return Image(uiImage: UIImage(data: data)!).resizable().frame(width: 100, height: 150).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 3))
        }else{
            return Image("default-placeholder").resizable().frame(width: 100, height: 150)
        }
    }
}

struct DownloadImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageView(imageUrl:"https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY256_CR4,0,172,256_AL_.jpg")
    }
}
