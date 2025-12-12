//
//  ContentView.swift
//  GesturesInSwiftUI
//
//  Created by Neosoft on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var isClick: Bool = false
    
    var body: some View {
        VStack {
            Image(.sample)
            .onTapGesture {
                location in
                isClick = true
                print("Location \(location)")
            }
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
