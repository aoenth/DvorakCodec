# DvorakEncoderDecoder

This is a Swift package that converts text from the QWERTY keyboard layout to the Dvorak keyboard layout and vice versa.

## Installation

You can add the DvorakEncoderDecoder package to your project using Swift Package Manager. To do this, add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/aoenth/DvorakEncoderDecoder.git", from: "1.0.0")
]
```

Then, add `DvorakEncoderDecoder` as a dependency for your target:

```swift
.target(
    name: "YourProject",
    dependencies: [
        "DvorakEncoderDecoder"
    ]
)
```

## Usage

Here's an example of how to use the DvorakEncoderDecoder in your Swift code.

You can use the `dvorakEncoded` function to convert text from QWERTY to Dvorak:

```swift
import DvorakEncoderDecoder

let text = "Hello, world!"
let encodedText = text.dvorakEncoded()
print(encodedText)  // Output: "D.nnrw ,rpne!"
```

and the `dvorakDecoded` function to convert text from Dvorak to QWERTY:

```swift
import DvorakEncoderDecoder

let text = "D.nnrw ,rpne!"
let decodedText = text.dvorakDecoded()
print(decodedText)  // Output: "Hello, world!"
```

## Contributing

If you find a bug or have a feature request, please [open an issue](https://github.com/aoenth/DvorakEncoderDecoder/issues/new). Pull requests are also welcome!

## License

This Swift package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
