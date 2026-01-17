//
//  ImageSizeIncreaseOnLongPress.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct ImageSizeIncreaseOnLongPress: View {
    @State private var size: CGFloat = 20
    @State var isClick: Bool = false
    @State var isPressing: Bool = false
    @State private var timer: Timer? = nil
    
    var body: some View {
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
    ImageSizeIncreaseOnLongPress()
}
