//
//  MagnifyingGesture.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct MagnifyingGesture: View {
    @State private var zoom: CGFloat = 1.0
    @GestureState private var rotationAngle: Angle = Angle.zero
    @State private var rotation: Angle = Angle.zero
    @GestureState private var magnification: CGFloat = 1.0
    
    var body: some View {
        Image(uiImage: .sample)
            .resizable()
            .scaledToFit()
            .scaleEffect(zoom * magnification)
//             Rotation effect
            .rotationEffect(rotation + rotationAngle)
//             To zoom the image
            .gesture(
                MagnifyGesture()
                    .updating($magnification) { value, state, _ in
                        state = value.magnification
                    }
                    .onEnded { value in
                        zoom *= value.magnification   // Store final zoom level
                    }
            )
    }
}

#Preview {
    MagnifyingGesture()
}
