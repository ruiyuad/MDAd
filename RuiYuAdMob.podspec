Pod::Spec.new do |s|

  s.name         = "RuiYuAdMob"

  s.version      = "0.1.0"

  s.summary      = "A ads framework that show universal ads types."

  s.description  = "Your can access RuiYuAdMob.framework to show ads such as banner ads, interstitial Ads and video ads."

  s.homepage     = "https://github.com/ruiyuad"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Ruiyu" => "admin@mobiw.com" }

  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/ruiyuad/RYAds.git", :tag => "#{s.version}" }

  s.swift_versions = "4.2"

  s.ios.vendored_frameworks = 'RuiYuAdMob.framework'


end

