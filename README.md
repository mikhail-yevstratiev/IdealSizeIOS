# Overview

Simple iOS SDK that prompts users to input height and weight and then recommends an ideal size.

# Requirements

iOS 16.0+, MacOS 13.0+

# Installation

To add this package to your Xcode project, select **File > Add Package Dependency** and paste https://github.com/mikhail-yevstratiev/IdealSizeIOS into the Search field. Select IdealSizeIOS and press Add package.

# Usage

There is a [sample Xcode project](./IdealSizeIOSExample) that demonstrates the usage of this plugin.

### Calculate perfect size from known Body Mass Index

```swift
import IdealSize

let size = try IdealSize.sizeByBMI(with: 18.0)
```

### Show Recommendations View

```swift
import SwiftUI
import IdealSizeIOS

struct ContentView: View {
    @State private var showInputView = false

    var body: some View {
        NavigationStack {
            VStack {
                Button("Find Your Perfect Fit") {
                    showInputView = true
                }
                .navigationDestination(isPresented: $showInputView) {
                    InputView() // navigate to IdealSizeIOS InputView
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
```

# Licence

MIT. See [License](./LICENSE)
