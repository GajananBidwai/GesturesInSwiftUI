//
//  OnTapGesture.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct OnTapGesture: View {
    @State var isClick: Bool = false
    @State var isPressing: Bool = false
    
    var body: some View {
        VStack {
            Image(.sample)
                .opacity(isPressing ? 0 : 1)
            .onTapGesture {
                location in
                isClick = true
                print("Location \(location)")
            }
            .sheet(isPresented: $isClick) {
                ShowImage()
                
            }
        }
    }
}

#Preview {
    OnTapGesture()
}
