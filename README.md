# DvorakCodec

This is a Swift package that converts text from the QWERTY keyboard layout to the Dvorak keyboard layout and vice versa.

## Installation

You can add the DvorakCodec package to your project using Swift Package Manager. To do this, add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/aoenth/DvorakCodec.git", from: "1.0.0")
]
```

Then, add `DvorakCodec` as a dependency for your target:

```swift
.target(
    name: "YourProject",
    dependencies: [
        "DvorakCodec"
    ]
)
```

Alternatively, you can build the CLI and move it into a location in your PATH.

```bash
$ swift build -c release --target dv
$ mv .build/release/dv /usr/local/bin
```
## Usage

### As a Library
Here's an example of how to use the DvorakCodec in your Swift code.

You can use the `dvorakEncoded` function to convert text from QWERTY to Dvorak:

```swift
import DvorakCodec

let text = "Hello, world!"
let encodedText = text.dvorakEncoded()
print(encodedText)  // Output: "D.nnrw ,rpne!"
```

and the `dvorakDecoded` function to convert text from Dvorak to QWERTY:

```swift
import DvorakCodec

let text = "D.nnrw ,rpne!"
let decodedText = text.dvorakDecoded()
print(decodedText)  // Output: "Hello, world!"
```

### As a CLI tool
After installation, you can execute `dv` in the CLI. It takes in standard input and writes to standard output by default.

```bash
$ echo "hello" | dv
d.nnr
```

If you have multiple lines:

```bash
$ dv <<EOF
> 1. Thanks to its high-performance and easy-to-use syntax, Swift has become the go-to programming language for building modern iOS and macOS apps.
> 2. With its powerful memory management and advanced features such as optionals and closures, Swift has quickly established itself as one of the most popular programming languages in the industry.
> 3. Whether you're a beginner or an experienced developer, Swift's clean and expressive syntax makes it a joy to write code and create amazing apps for Apple's platforms.
> EOF
1v Ydabto yr cyo dcid[l.purpmabj. abe .aof[yr[go. ofbyaqw O,cuy dao x.jrm. yd. ir[yr lpripammcbi nabigai. urp xgcnecbi mre.pb cRO abe majRO allov
2v <cyd cyo lr,.pugn m.mrpf mabai.m.by abe aekabj.e u.aygp.o ogjd ao rlycrbano abe jnrogp.ow O,cuy dao 'gcjtnf .oyaxncod.e cyo.nu ao rb. ru yd. mroy lrlgnap lpripammcbi nabigai.o cb yd. cbegoypfv
3v <d.yd.p frg-p. a x.icbb.p rp ab .ql.pc.bj.e e.k.nrl.pw O,cuy-o jn.ab abe .qlp.oock. ofbyaq mat.o cy a hrf yr ,pcy. jre. abe jp.ay. ama;cbi allo urp Alln.-o lnayurpmov
```

You can also transform content of your clipboard with the "-t" flag, "t" for "transform".

```bash
$ echo Hello! | pbcopy # Put some strings into your pasteboard on Mac
$ dv -t                # Transform pasteboard content
$ pbpaste              # Paste pasteboard content in terminal
D.nnr!
```

Adding the `-d` flag to decode from Dvorak encoding:
```bash
$ echo D.nnr! | dv -d
Hello!
```

## Contributing

If you find a bug or have a feature request, please [open an issue](https://github.com/aoenth/DvorakCodec/issues/new). Pull requests are also welcome!

## License

This Swift package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
