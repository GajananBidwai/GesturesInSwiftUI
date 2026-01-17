//
//  TopicResponse.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 17/01/26.
//

import Foundation

struct TopicsResponse: Codable {
    let topics: [Topic]
}

// Topic Model
struct Topic: Codable, Identifiable {
    let id: Int
    let name: String
}
