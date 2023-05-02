//
//  PersonView.swift
//  BigTech
//
//  Created by SERGEI on 05.04.2023.
//

import SwiftUI
import MapKit

struct PersonView: View {
    private let scrn = UIScreen.main.bounds
    
//MARK: Property
    @State var name : String
    @State var surname : String
    @State var old : Int
    @State var gender : String
    @State var positionTitle : String
    @State var positionSalary : Int
    @State var gotPositionIn : String
    @State var avatarUrl : String
    @State var coordinatesLat : Double
    @State var coordinatesLon : Double
    @State var region = MKCoordinateRegion()
    
// MARK: coordinates
    private var coordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinatesLat, longitude: coordinatesLon)
    }
    
// MARK: dismiss
    @Environment(\.dismiss) private var dismiss
    
// MARK: Body
    var body: some View {
        VStack(alignment: .center){
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .gray, radius: 10,y: 1)
                .frame(width: scrn.width, height: 10)
                .opacity(0.3)
                .fixedSize()
            AsyncImage(url: URL(string: avatarUrl))
            { image in
                image.resizable()
            } placeholder: {
                EmptyAvatar()
            }
            .frame(width: scrn.width/1.5,height: scrn.height/3.5)
            .cornerRadius(5)
            .aspectRatio(contentMode: .fit)
            .padding(.top)
// MARK: Texts block
            VStack{
                VStack(alignment: .leading,spacing: 0){
                    HStack(spacing: 3) {
                        Text("Полных лет:").font(.system(size: 18)).bold()
                        Text(String(old))
                    }
                    HStack(spacing: 3) {
                        Text("Пол:").font(.system(size: 18)).bold()
                        Text(gender)
                    }
                    HStack {
                        Text("Дата трудоустройства:").font(.system(size: 18)).bold()
                        Text(gotPositionIn).font(.system(size: 18))
                    }
                    HStack {
                        Text("Должность:").font(.system(size: 18)).bold()
                        Text(positionTitle).font(.system(size: 18))
                    }
                    HStack {
                        Text("Заработная плата:").font(.system(size: 18)).bold()
                        Text(String(positionSalary) + "$").font(.system(size: 18))
                    }
                }.padding(.top)
                Spacer()
            }
//MARK: Map block
            if coordinatesLon != 0.0 && coordinatesLat != 0.0 {
                Divider()
                    .padding(.horizontal).padding(.bottom).padding(.top)
                Spacer()
                Text("Текущее местоположение").font(.system(size: 18)).bold()
                Map(coordinateRegion: $region, annotationItems: [CustomMarker(avatar: avatarUrl, coordinate: coordinates)], annotationContent: { _ in
                    MapAnnotation(coordinate: coordinates) {
                        CustomMarker(avatar: avatarUrl, coordinate: coordinates)
                    }
                })
                .allowsHitTesting(false)
                .frame(width: scrn.width,height: scrn.height/3.5)
            }
        }
//MARK: NavigationBar
        .navigationBarTitle("\(name) \(surname)", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onAppear(){
            setRegion(coordinates)
        }
    }
    
//MARK: backButton
    private var backButton : some View {
        Button{
            dismiss()
        } label:{
            Image(systemName: "arrowshape.turn.up.backward.fill").foregroundColor(.black)
        }
    }
    
//MARK: setRegion
    func setRegion(_ coordinates: CLLocationCoordinate2D){
        region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(name: "s", surname: "s", old: 1, gender: "s", positionTitle: "s", positionSalary: 1, gotPositionIn: "s", avatarUrl: "s", coordinatesLat: 1.0, coordinatesLon: 1.0)
    }
}
