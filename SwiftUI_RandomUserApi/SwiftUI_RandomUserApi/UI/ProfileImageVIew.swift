//
//  ProfileImageVIew.swift
//  SwiftUI_RandomUserApi
//
//  Created by 홍승재 on 2022/08/08.
//

import SwiftUI
import URLImage

struct ProfileImageVIew: View {
    
    var urlImage: URL
    
    var body: some View {
        URLImage(urlImage) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .overlay(Circle().stroke(.yellow, lineWidth: 2))
    }
}

struct ProfileImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://randomuser.me/api/portraits/men/96.jpg")!
        ProfileImageVIew(urlImage: url)
    }
}
