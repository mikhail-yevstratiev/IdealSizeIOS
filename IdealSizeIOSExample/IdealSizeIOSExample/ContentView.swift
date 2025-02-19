//
//  ContentView.swift
//  IdealSizeIOSApp
//
//  Created by Mikhail on 19.02.2025.
//

import SwiftUI
import IdealSizeIOS

struct ContentView: View {
    @State private var showModal = false

    var body: some View {
        NavigationStack {
            VStack {
                Button("Find Your Perfect Fit") {
                    showModal = true
                }
                .navigationDestination(isPresented: $showModal) {
                    InputView()
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
