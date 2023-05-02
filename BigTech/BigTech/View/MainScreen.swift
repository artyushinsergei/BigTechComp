//
//  MainScreen.swift
//  BigTech
//
//  Created by SERGEI on 29.03.2023.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var vm = CompanyInfoViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                ScrollView(.vertical,showsIndicators: false){
                    VStack(alignment: .leading,spacing: 10){
// MARK: Специалисты
                        Text("Специалисты")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom).padding(.leading)
                        SpecialistsCollectionViewCell()
// MARK: Услуги
                        VStack(alignment: .leading, content: {
                            Text("Услуги компании")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.top)
                        }).padding(.leading)
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                BottomCollectionViewCell()
                            }.frame(height: 80)
                                .padding(.bottom).padding(.leading)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Компания «\(vm.companyInfo?.company.name ?? " ")»")
                        .font(.title3)
                        .fontWeight(.bold)
                        .lineLimit(0)
                        .padding(.horizontal)
                        .fixedSize()
                }
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
