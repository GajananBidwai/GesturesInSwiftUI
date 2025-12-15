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
    @GestureState private var magnification: CGFloat = 1.0
    @State private var zoom: CGFloat = 1.0
    @GestureState private var rotationAngle: Angle = Angle.zero
    @State private var rotation: Angle = Angle.zero
    @State private var picture: UIImage?
    @State private var droppedImage: UIImage?
    
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
//            VStack {
//                Image(.sample)
//                    .resizable()
//                    .frame(width: size, height: size)
//                    .animation(.easeInOut(duration: 0.1), value: size)
//            }
//            .onLongPressGesture(minimumDuration: 0.0, pressing: { pressing in
//                if pressing {
//                    startGrowing()
//                } else {
//                    stopGrowing()
//                }
//            }, perform: {})
            
//            Image(uiImage: .sample)
//                .resizable()
//                .scaledToFit()
//                .scaleEffect(zoom * magnification)
            // Rotation effect
//                .rotationEffect(rotation + rotationAngle)
            // To zoom the image
//                .gesture(
//                    MagnifyGesture()
//                        .updating($magnification) { value, state, _ in
//                            state = value.magnification
//                        }
//                        .onEnded { value in
//                            zoom *= value.magnification   // Store final zoom level
//                        }
//                )
//                .gesture(RotateGesture().updating($rotationAngle, body: { value, state, transaction in
//                    state = value.rotation
//                })
//                    .onEnded({ value in
//                        rotation = rotation + value.rotation
//                }))
                  
            //Hold and drag and drop the image - can test in ipad simulater splite the device
            Rectangle()
                .fill(.gray.opacity(0.2))
                .frame(width: 220, height: 220)
                .overlay {
                    if let droppedImage {
                        Image(uiImage: droppedImage)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Drop Here")
                    }
                }
                .dropDestination(for: TransferImage.self) { items, _ in
                    droppedImage = items.first?.image
                    return droppedImage != nil
                }
                
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
