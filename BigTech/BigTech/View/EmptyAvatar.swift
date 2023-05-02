//
//  EmptyAvatar.swift
//  BigTech
//
//  Created by SERGEI on 27.04.2023.
//

import SwiftUI

struct EmptyAvatar: View {
    var body: some View {
        Image(systemName: "person")
            .resizable()
    }
}

struct EmptyAvatar_Previews: PreviewProvider {
    static var previews: some View {
        EmptyAvatar()
    }
}
