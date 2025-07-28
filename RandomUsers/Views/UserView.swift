//
//  UserView.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import MapKit
import SwiftUI

struct UserView: View {
    @State var user: User
    @State var camerPosition: MapCameraPosition
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
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
                        Image(.defaultUser)
                            .resizable()
                            .scaledToFill()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(user.name.fullName)
                            .font(.largeTitle.bold())
                            .padding(.bottom)
                            .multilineTextAlignment(.leading)
                        
                        Text("Email: \(user.email)")
                        Text("Gender: \(user.gender)")
                        Text("Street: \(user.location.street.fullStreet)")
                        Text("City: \(user.location.city)")
                        Text("State: \(user.location.state)")
                        Text("Registered: \(user.registered.date)")
                        
                        
                        Map(position: $camerPosition) {
                            Annotation(user.name.first, coordinate: user.location.mapLocation) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                        }
                        .clipShape(.rect(cornerRadius: 15))
                        
                    }
                    .padding([.leading, .trailing], 25)
                }
                .padding([.bottom])
                
            }
            .frame(width: geo.size.width)
        }
    }
}

#Preview {
    NavigationStack {
        UserView(user: Preview.user, camerPosition: MapCameraPosition.camera(MapCamera(centerCoordinate: Preview.user.location.mapLocation, distance: 30000)))
    }
}
