//
//  TopicListView.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import SwiftUI

struct TopicsListView: View {
    @StateObject private var viewModel = TopicsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.topics) { topic in
                NavigationLink {
                    destinationView(for: topic)
                } label: {
                    Text(topic.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Map Topics")
            .onAppear {
                viewModel.loadTopics()
            }
        }
    }
    
    @ViewBuilder
    func destinationView(for topic: Topic) -> some View {
        switch topic.name {
        case "On-TapGesture":
            OnTapGesture()
            
        case "OnLongGesture":
            OnLongGesture()

        case "ImageSizeIncreaseOnLongPress":
            ImageSizeIncreaseOnLongPress()
            
        case "MagnifyGesture":
            MagnifyingGesture()

        case "RotateGesture":
            RotationGesture()
            
        case "TransferableProtocol":
            TransferableProtocol()

        default:
            Text("Coming Soon")
        }
    }

}
#Preview {
    TopicsListView()
}
