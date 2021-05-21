Pod::Spec.new do |spec|
spec.name          = 'CWNetworkSDK'
spec.version       = '1.0.0'
spec.license       = { :type => 'MIT' }
spec.homepage      = 'https://www.tatacliq.com'
spec.authors       = { 'Aravindhan' => 'anatarajan@tataunistore.com' }
spec.summary       = 'CliQCare SDK'
spec.source        = { :git => 'https://github.com/aravindhan-natarajan/CWNetworkSDK', :tag => spec.version }

spec.ios.deployment_target  = '10.0'
spec.swift_version = '5'

spec.source_files   = '*/native/CWNetworkSDK/**/*.{swift,h,m}'
spec.resources = '*/native/CWNetworkSDK/**/*.{strings,xib,xcassets,strings,ttf,otf,css,js,html,storyboard,eot,svg,woff,xcdatamodeld,json,sh,rb,py,gif,jpeg,jpg}'

spec.framework      = 'UIKit'

end
