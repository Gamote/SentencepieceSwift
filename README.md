# SentencepieceSwift

A Swift wrapper for Google's [SentencePiece](https://github.com/google/sentencepiece) tokenizer. Tokenize, encode, and decode text from SentencePiece models in native iOS/macOS apps.

## Installation

```ruby
pod 'SentencepieceSwift'
````

## Usage

```swift
import Sentencepiece

let tokenizer = try SentencepieceTokenizer(modelPath: "model.model")
let ids = try tokenizer.encode("Hello, world")
let text = try tokenizer.decode(ids)
```

## License

MIT
