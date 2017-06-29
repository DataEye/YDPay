Pod::Spec.new do |s|
  s.name             = "YDPay"
  s.version          = "1.1.6"
  s.summary          = "优点付费SDK, 纯WAP版"
  s.description      = <<-DESC
优点付费SDK，集成了微信、支付宝、银联等主流的支付SDK，为开发者提供统一的支付接入体验。
                       DESC

  s.homepage         = "https://www.dataeye.com"
  s.license          = 'MIT'
  s.author           = { "xqwang" => "wxq491216@163.com" }
  s.source           = { :git => "https://github.com/DataEye/YDPay.git"}

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'YDPay/*.h'
  s.vendored_libraries = 'YDPay/*.a'
  s.resources = 'YDPay/YDTool.bundle'

  s.dependency 'AFNetworking', '~> 3.0' 
  s.dependency 'MBProgressHUD'
  s.dependency 'Masonry'
  s.dependency 'SDWebImage'
end
