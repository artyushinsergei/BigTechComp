//
//  CustomMarker.swift
//  BigTech
//
//  Created by SERGEI on 28.04.2023.
//

import SwiftUI
import MapKit

struct CustomMarker: View, Identifiable {
    var id = UUID()
    var avatar: String
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 2, height: 15)
                .padding(.top, 40)
            ZStack{
                AsyncImage(url: URL(string: avatar))
                { image in
                    image.resizable()
                } placeholder: {
                    EmptyAvatar()
                }
                .cornerRadius(15)
                .frame(width: 30,height: 30)
                Image(systemName: "circle")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 35,height: 35)
            }
        }
        .padding(.bottom, 55)
    }
}

struct CustomMarker_Previews: PreviewProvider {
    static var previews: some View {
        CustomMarker(avatar: "s", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
    }
}
