//
//  SpecialistsCollectionViewCell.swift
//  BigTech
//
//  Created by SERGEI on 30.03.2023.
//
import SwiftUI

struct SpecialistsCollectionViewCell: View {
    
    @ObservedObject var vm = CompanyInfoViewModel()
    
    private let scrn = UIScreen.main.bounds
    
    var body: some View {
        ForEach(vm.companyInfo?.company.employers ?? [], id: \.self) { employer in
            NavigationLink(destination: PersonView(name: employer.name,
                                                   surname: employer.surname,
                                                   old: employer.old,
                                                   gender: employer.gender,
                                                   positionTitle: employer.position.title,
                                                   positionSalary: employer.position.salary,
                                                   gotPositionIn: employer.gotPositionIn,
                                                   avatarUrl: employer.avatarURL ?? "nothing",
                                                   coordinatesLat: employer.coordinates?.lat ?? 0.0,
                                                   coordinatesLon: employer.coordinates?.lon ?? 0.0)){
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxWidth: .infinity, maxHeight: scrn.height / 4)
                        .foregroundColor(Color.white)
                        .shadow(radius: 4,x: 4, y: 4)
                    HStack(){
                        AsyncImage(url: URL(string: String(employer.avatarURL ?? "nothing")))
                        { image in
                            image.resizable()
                        } placeholder: {
                            EmptyAvatar()
                        }
                        .frame(width: scrn.width / 2.5)
                        .cornerRadius(15)
                        VStack(alignment: .leading){
                            VStack(alignment: .leading,spacing: 0){
                                Text("\(employer.name) \(employer.surname)").font(.system(size: 18)).bold()
                                HStack(spacing: 3) {
                                    Text("Полных лет:").font(.system(size: 18)).bold()
                                    Text(String(employer.old))
                                }
                                HStack(spacing: 3) {
                                    Text("Пол:").font(.system(size: 18)).bold()
                                    Text(employer.gender)
                                }
                            }.padding(.top)
                            Divider()
                                .padding(.trailing)
                            VStack(alignment: .leading, spacing: 0){
                                Text("Дата трудоустройства:").font(.system(size: 14)).bold()
                                Text(employer.gotPositionIn).font(.system(size: 14))
                            }.padding(.bottom)
                        }
                    }.shadow(radius: 2,x: 1,y: 1)
                } 
            }.foregroundColor(.black)
        }.padding(.horizontal)
    }
}

struct SpecialistsCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistsCollectionViewCell()
    }
}
