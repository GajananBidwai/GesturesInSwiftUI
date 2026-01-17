//
//  TransferableProtocol.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct TransferableProtocol: View {
    @State private var droppedImage: UIImage?
    
    var body: some View {
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
}

#Preview {
    TransferableProtocol()
}
