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
    @State private var timer: Timer? = nil
    @State private var size: CGFloat = 20
    
    var body: some View {
        VStack {
//            Image(.sample)
//                .opacity(isPressing ? 0 : 1)
////            .onTapGesture {
////                location in
////                isClick = true
////                print("Location \(location)")
////            }
//            .onLongPressGesture(minimumDuration: 1, maximumDistance: 10 ,perform: {
//                isClick = true
//            }, onPressingChanged: { value in
//                withAnimation(.easeInOut(duration: 1.5)) {
//                    isPressing = value
//                }
//            })
//            
//            .sheet(isPresented: $isClick) {
//                ShowImage()
//                
//            }
            VStack {
                Image(.sample)
                    .resizable()
                    .frame(width: size, height: size)
                    .animation(.easeInOut(duration: 0.1), value: size)
            }
            .onLongPressGesture(minimumDuration: 0.0, pressing: { pressing in
                if pressing {
                    startGrowing()
                } else {
                    stopGrowing()
                }
            }, perform: {})
            
                
        }
        .padding()
        
        
    }
    func startGrowing() {
        isPressing = true
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            if isPressing {
                size += 5
            }
        })
    }
    
    func stopGrowing() {
        isPressing = false
        timer?.invalidate()
        timer = nil
    }
    
}

#Preview {
    ContentView()
}
