Pod::Spec.new do |s|
  s.name         = "SwiftyConfiguration"
  s.version      = "2.0.0"
  s.summary      = "SwiftyConfiguration is modern Swift API for Plist."
  s.homepage     = "https://github.com/ykyouhei/SwiftyConfiguration"
  s.license      = "MIT"
  s.author       = { "Kyohei Yamaguchi" => "kyouhei.lab@gmail.com" }
  s.social_media_url   = "https://twitter.com/kyo__hei"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/ykyouhei/SwiftyConfiguration.git", :tag => s.version.to_s }
  s.source_files = "SwiftyConfiguration/Classes/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
end
