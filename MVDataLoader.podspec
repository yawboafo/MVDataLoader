Pod::Spec.new do |spec|
spec.name         = 'MVDataLoader'
spec.version      = '1.0'
spec.license      = 'MIT'
spec.summary      = 'A simple Network Layer for requesting multiple distinct resources in parallel'
spec.homepage     = 'https://github.com/yawboafo/MVDataLoader'
spec.author       = 'Yaw Boafo'
spec.ios.deployment_target  = '10.0'
spec.source       = { :git => 'https://github.com/yawboafo/MVDataLoader.git', :tag => 'v1.0' }
spec.source_files = 'MVDataLoader/*.{h,m,swift}'
spec.requires_arc = true
spec.swift_version = '4.2'

end
