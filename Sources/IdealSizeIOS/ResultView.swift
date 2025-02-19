//
//  ResultView.swift
//  IdealSizeIOS
//
//  Created by Mikhail on 19.02.2025.
//

import SwiftUI

public struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    var size: String

    public var body: some View {
        NavigationView {
            VStack {
                Text("Based on your info, size \(size) is recommended.")
                    .padding(.bottom, 40)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("OK")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
#if os(iOS)
            .navigationBarTitle("Your Recommended Size: \(size)", displayMode: .inline)
#endif
        }
    }
}

#Preview {
    ResultView(size: "M")
}
