Pod::Spec.new do |s|
  s.name             = "Activetrail"
  s.version          = "0.1.1"
  s.summary          = "React Native wrapper for the ActiveTrail iOS SDK"
  s.description      = <<-DESC
                       A TurboModule-based React Native library that bridges the ActiveTrail native iOS SDK to JavaScript.
                       DESC
  s.homepage         = "https://activetrail.com"
  s.license          = { :type => "MIT", :file => "../LICENSE" }
  s.author           = { "Bhavya Koshiya" => "bhavyakoshiya555@gmail.com" }
  s.platform         = :ios, "12.0"
  s.source           = { :path => "." }

  s.source_files     = "ios/**/*.{swift,mm,h,m}"
  s.vendored_frameworks = "ios/ActiveTrail-Push-SDK-iOS.xcframework"
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'CLANG_MODULES_AUTOLINK' => 'YES'
  }
  s.module_map = nil
  s.public_header_files = []
  s.header_mappings_dir = nil
  s.requires_arc     = true
  s.swift_version    = "5.0"

  s.dependency "React-Core"
end
