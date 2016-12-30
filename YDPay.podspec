Pod::Spec.new do |s|
  s.name             = "YDPay"
  s.version          = "1.0.0.1"
  s.summary          = "优点付费SDK"
  s.description      = <<-DESC
优点付费SDK，集成了微信、支付宝、银联等主流的支付SDK，为开发者提供统一的支付接入体验。
                       DESC

  s.homepage         = "https://www.dataeye.com"
  s.license          = 'MIT'
  s.author           = { "xqwang" => "wxq491216@163.com" }
  s.source           = { :git => "https://github.com/DataEye/YDPay.git"}

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'YDPay/*.h', 'YDPay/SPaySDK/include/*.h', 'YDPay/wechat/*.h'
  s.vendored_libraries = 'YDPay/*.a', 'YDPay/SPaySDK/libSPaySDK.a', 'YDPay/wechat/libWeChatSDK.a'
  s.vendored_framework = 'YDPay/AlipaySDK.framework'
  s.resources = 'YDPay/AlipaySDK.bundle', 'YDPay/YDPay.bundle', 'YDPay/SPaySDK/SPaySDKResource.bundle'
 
  s.frameworks = 'CoreMotion', 'CFNetwork', 'Foundation', 'UIKit', 'CoreGraphics', 'CoreText', 'QuartzCore', 'AdSupport', 'Security', 'CoreTelephony', 'CoreLocation', 'SystemConfiguration', 'AVFoundation'
  s.libraries  = 'z', 'c++', 'sqlite3'

  s.dependency 'AFNetworking', '~> 3.0' 
end
