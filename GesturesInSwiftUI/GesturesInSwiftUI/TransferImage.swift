//
//  TransferImage.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 15/12/25.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct TransferImage: Transferable {
    let image: UIImage

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: .png) { item in
            item.image.pngData()!
        } importing: { data in
            guard let image = UIImage(data: data) else {
                throw CocoaError(.fileReadCorruptFile)
            }
            return TransferImage(image: image)
        }
    }
}
