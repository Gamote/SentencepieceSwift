# SentencepieceSwift

A Swift wrapper for Google's [SentencePiece](https://github.com/google/sentencepiece) tokenizer. Tokenize, encode, and decode text from SentencePiece models in native iOS apps.

## Installation

```ruby
pod 'SentencepieceSwift'
````

## Usage

```swift
import SentencepieceSwift

let tokenizer = try SentencepieceTokenizer(modelPath: "/path/to/sentencepiece.model")

let encoded = try tokenizer.encode("Hello, world")
print(encoded)

let decoded = try tokenizer.decode([35378, 4, 8999, 38])
print(decoded)
```

## License

MIT
