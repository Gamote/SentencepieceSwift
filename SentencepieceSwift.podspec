Pod::Spec.new do |s|
    s.name             = 'SentencepieceSwift'
    s.version          = '0.1.0'
    s.summary          = 'Swift wrapper for Google’s SentencePiece tokenizer.'
    s.homepage         = 'https://github.com/Gamote/SentencepieceSwift'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Gamote' => 'contact@gamote.com' }
    s.source           = { :git => 'https://github.com/Gamote/SentencepieceSwift.git', :tag => s.version.to_s }

    # Download & unzip the Google's SentencePiece XCFramework
    s.prepare_command = <<-CMD
      rm -rf Frameworks/sentencepiece.xcframework
      mkdir -p Frameworks
      curl -fL https://github.com/jkrukowski/swift-sentencepiece/releases/download/0.0.5/sentencepiece.xcframework.zip -o /tmp/sp.zip
      unzip -o /tmp/sp.zip -d Frameworks
      rm /tmp/sp.zip
    CMD

    s.vendored_frameworks = 'Frameworks/sentencepiece.xcframework'

    # The Swift wrapper entrypoint(s)
    s.source_files      = 'Sources/SentencepieceSwift/**/*.swift'

    # Ensure C++ linkage (the XCFramework already bundles the lib, but we need the flag)
    s.pod_target_xcconfig = {
        'OTHER_LDFLAGS'               => '-lc++',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17'
    }

    s.requires_arc = true
    s.platform     = :ios, '11.0'
    s.swift_version = '5.0'
end
