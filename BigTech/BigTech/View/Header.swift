//
//  Header.swift
//  BigTech
//
//  Created by SERGEI on 31.03.2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Компания «Большие технологии»")
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(0)
                .padding(.horizontal)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
