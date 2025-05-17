# Development setup

## Setup

### Link the Google's SentencePiece `.xcframework`

For now, we will link the `.xcframework` from another Swift package, that is published only to Swift Package Manager.

1. Add `Frameworks/` to the `.gitignore` file.

2. Add a prepare_command to your .podspec to download and unzip the XCFramework at pod install time:

   ```ruby
   Pod::Spec.new do |s|
     # … metadata …
   
     # Download & unzip the Google's SentencePiece XCFramework
     s.prepare_command = <<-CMD
       rm -rf Frameworks/sentencepiece.xcframework
       mkdir -p Frameworks
       curl -fL https://github.com/jkrukowski/swift-sentencepiece/releases/download/0.0.5/sentencepiece.xcframework.zip -o /tmp/sp.zip
       unzip -o /tmp/sp.zip -d Frameworks
       rm /tmp/sp.zip
     CMD
   
     s.vendored_frameworks = 'Frameworks/sentencepiece.xcframework'
     # … rest of spec …
   end
   ```

## Publishing

1. Validate locally
   ```bash
   pod lib lint SentencepieceSwift.podspec --allow-warnings
   ```
2. Register with CocoaPods
   ```bash
   pod trunk register contact@gamote.com "Gamote" --description="MacBook Pro"
   ```
   > This will send a confirmation email to the registered email address. You need to confirm it before you can publish.
3. Publish to CocoaPods
   ```bash
   pod trunk push SentencepieceSwift.podspec
   ```
   
Done ✨
