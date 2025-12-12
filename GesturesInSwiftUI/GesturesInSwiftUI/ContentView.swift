//
//  ContentView.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var isClick: Bool = false
    @State var isPressing: Bool = false
    
    var body: some View {
        VStack {
            Image(.sample)
                .opacity(isPressing ? 0 : 1)
//            .onTapGesture {
//                location in
//                isClick = true
//                print("Location \(location)")
//            }
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
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
