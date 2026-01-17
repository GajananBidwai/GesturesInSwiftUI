//
//  RotationGesture.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct RotationGesture: View {
    @GestureState private var magnification: CGFloat = 1.0
    @State private var zoom: CGFloat = 1.0
    @GestureState private var rotationAngle: Angle = Angle.zero
    @State private var rotation: Angle = Angle.zero
    
    var body: some View {
        Image(uiImage: .sample)
            .resizable()
            .scaledToFit()
            .scaleEffect(zoom * magnification)
//             Rotation effect
            .rotationEffect(rotation + rotationAngle)
            .gesture(RotateGesture().updating($rotationAngle, body: { value, state, transaction in
                state = value.rotation
            })
                .onEnded({ value in
                    rotation = rotation + value.rotation
            }))
        
    }
}

#Preview {
    RotationGesture()
}
