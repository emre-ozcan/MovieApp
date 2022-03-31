//
//  IconText.swift
//  MovieApp
//
//  Created by Emre Özcan on 31.03.2022.
//

import SwiftUI

struct IconText: View {
    let text: String?
    let image: String
    var body: some View {
        VStack{
            Spacer()
            Label(text ?? "...", systemImage: image)
        }
    }
}

struct IconText_Previews: PreviewProvider {
    static var previews: some View {
        IconText(text: "text", image: "person")
    }
}
