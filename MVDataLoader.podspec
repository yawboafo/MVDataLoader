Pod::Spec.new do |spec|
spec.name         = 'MVDataLoader'
spec.version      = '1.3'
spec.license      = 'MIT'
spec.summary      = 'A simple Network Layer for requesting multiple distinct resources in parallel'
spec.homepage     = 'https://github.com/yawboafo/MVDataLoader'
spec.author       = 'Yaw Boafo'
spec.ios.deployment_target  = '10.0'
spec.source       = { :git => 'https://github.com/yawboafo/MVDataLoader.git', :commit => '263c8216857b665a62d89397c3219401489031cc' }
spec.source_files =  'MVDataLoader/Sources/*.{h,m,swift}'
spec.requires_arc = true
spec.swift_version = '4.2'

end
