//
//  RandomUserView.swift
//  SwiftUI_RandomUserApi
//
//  Created by 홍승재 on 2022/08/08.
//

import SwiftUI

struct RandomUserView: View {
    
    var randomUser: RandomUser
    
    init(_ randonUser: RandomUser) {
        self.randomUser = randonUser
    }
    
    var body: some View {
        HStack {
            ProfileImageVIew(urlImage: randomUser.ProFileImageURL)
            Text("\(randomUser.description)")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
        .padding(.vertical)
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView(RandomUser.getDummy())
    }
}
