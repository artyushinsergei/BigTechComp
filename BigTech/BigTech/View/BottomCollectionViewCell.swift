//
//  BottomCollectionViewCell.swift
//  BigTech
//
//  Created by SERGEI on 02.04.2023.
//

import SwiftUI

struct BottomCollectionViewCell: View {
    @ObservedObject var vm = CompanyInfoViewModel()
    
    var body: some View {
        
        ForEach(vm.companyInfo?.company.priceList ?? [], id: \.self) { pl in
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 15)
                    .frame(minWidth: 30,maxWidth: 300,minHeight: 30,maxHeight: 70)
                    .foregroundColor(Color.white)
                    .shadow(radius: 4,y: 4)
                VStack(alignment: .leading) {
                    Text(pl.title).bold()
                    HStack {
                        Text("Цена:").bold()
                        Text("\(pl.price)" + " $")
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct BottomCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        BottomCollectionViewCell()
    }
}
