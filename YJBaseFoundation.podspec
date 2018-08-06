

Pod::Spec.new do |s|


  s.name         = "YJBaseFoundation"
  s.version      = "0.0.1"
  s.summary      = "YJBaseFoundation base Classes for project"

  
  s.description  = <<-DESC
  				项目基础
                   DESC

  s.homepage     = "https://github.com/YiyoJieyan/YJBaseFoundation"
  

  s.license      = "MIT"
  

  s.author       = { "yiyojieyan" => "yiyojieyan@126.com" }
  
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/YiyoJieyan/YJBaseFoundation.git", :tag => "#{s.version}" }

  s.source_files  = "YJBaseFoundation/*.{h,m}"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency 'WRNavigationBar','~>1.2.0'

end
