//
//  UserView.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import SwiftUI

struct UserView: View {
    @State var user: User
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack() {
                    AsyncImage(url: URL(string: user.picture.large)) {
                        image in
                        image
                            .resizable()
                            .scaledToFill()
                            .mask(LinearGradient(gradient: Gradient(stops: [
                                .init(color: .black, location: 0),
                                .init(color: .clear, location: 1)
                            ]), startPoint: .top, endPoint: .bottom))
                    } placeholder: {
                        Color.red
                    }
                    
                    VStack(alignment: .leading) {
                        Text(user.name.fullName)
                            .font(.largeTitle)
                        
                        Text(user.email)
                        Text(user.gender)
                        
                    }
                    .frame(width: geo.size.width, alignment: .leading)
                    .padding([.leading])
                }
                .padding([.bottom])
            }
            .frame(width: geo.size.width, height: geo.size.height * 0.8)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    UserView(user: Preview().user)
}
