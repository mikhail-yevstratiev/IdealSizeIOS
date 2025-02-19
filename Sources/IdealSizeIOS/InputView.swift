//
//  ResultView.swift
//  IdealSizeIOS
//
//  Created by Mikhail on 19.02.2025.
//

import SwiftUI

@available(iOS 16.0, macOS 13.0, *)
public struct InputView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var size: SizeEnum?
    @State private var showResult: Bool = false
    @State private var showError: Bool = false
    @State private var errorMessage: String?
    
    public init(){}

    public var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Height:")
                    TextField("Enter your height", text: $height)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
#if os(iOS)
                        .keyboardType(.numberPad)
#endif
                    Text("cm").frame(width: 32)
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("Weight:")
                    TextField("Enter your weight", text: $weight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
#if os(iOS)
                        .keyboardType(.numberPad)
#endif
                    Text("kg").frame(width: 32)
                }
                .padding(.bottom, 20)

                Button(action: {
                    recommendTapped();
                }) {
                    Text("Get Size Recommendation")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text(errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
#if os(iOS)
            .navigationBarTitle("Find Your Perfect Fit", displayMode: .inline)
#endif
            .navigationDestination(isPresented: $showResult) {
                ResultView(size: size?.rawValue ?? "Unknown").navigationBarBackButtonHidden()
            }
            
        }
    }

    private func recommendTapped() {
        guard let heightValue = Float(height), heightValue > 0,
            let weightValue = Float(weight), weightValue > 0
        else {
            errorMessage = "Height and weight should be positive numbers"
            showError = true
            return
        }
        
        errorMessage = nil

        let bmi = IdealSize.calculateBMI(with: heightValue, with: weightValue)

        do {
            size = try IdealSize.sizeByBMI(with: bmi)
            showResult = true
        } catch is IdealSizeError {
            errorMessage = "Invalid height or weight"
        } catch {
            errorMessage = "Unknown error"
        }
        
        showError = errorMessage != nil
    }
}

#Preview {
    InputView()
}
