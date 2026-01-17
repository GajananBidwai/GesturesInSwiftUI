//
//  OnLongGesture.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct OnLongGesture: View {
    @State var isClick: Bool = false
    @State var isPressing: Bool = false
    
    var body: some View {
        Image(.sample)
            .onLongPressGesture(minimumDuration: 1, maximumDistance: 10 ,perform: {
                isClick = true
            }, onPressingChanged: { value in
                withAnimation(.easeInOut(duration: 1.5)) {
                    isPressing = value
                }
            })
            
            .sheet(isPresented: $isClick) {
                ShowImage()
                
            }
    }
}

#Preview {
    OnLongGesture()
}
