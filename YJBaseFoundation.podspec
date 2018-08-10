

Pod::Spec.new do |s|


  s.name         = "YJBaseFoundation"
  s.version      = "0.0.5"
  s.summary      = "YJBaseFoundation"

  
  s.description  = <<-DESC
  				项目基础类以及工具以及相关第三方
                   DESC

  s.homepage     = "https://github.com/YiyoJieyan/YJBaseFoundation"
  

  s.license      = "MIT"
  

  s.author       = { "yiyojieyan" => "yiyojieyan@126.com" }
  
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/YiyoJieyan/YJBaseFoundation.git", :tag => "#{s.version}" }

  s.source_files  = "YJBaseFoundation/*.{h,m}"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency 'WRNavigationBar','~>1.2.0'
  s.dependency 'SDWebImage','~>3.8.2'
  s.dependency 'MJRefresh','~>3.1.15.3'
  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'SVProgressHUD'
  s.dependency 'MJExtension'


end
