//
//  ShowImage.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 12/12/25.
//

import SwiftUI

struct ShowImage: View {
    var body: some View {
        Image(.sample)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
        
}

#Preview {
    ShowImage()
}
