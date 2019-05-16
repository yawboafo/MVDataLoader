Pod::Spec.new do |spec|
spec.name         = 'MVDataLoader'
spec.version      = '1.4'
spec.license      = 'MIT'
spec.summary      = 'A simple Network Layer for requesting multiple distinct resources in parallel'
spec.homepage     = 'https://github.com/yawboafo/MVDataLoader'
spec.author       = 'Yaw Boafo'
spec.ios.deployment_target  = '10.0'
spec.source       = { :git => 'https://github.com/yawboafo/MVDataLoader.git', :commit => 'b53191ac2c12dc80cd77c2a3eb9b055a9a594b17' }
spec.source_files =  'MVDataLoader/Sources/*.{h,m,swift}'
spec.requires_arc = true
spec.swift_version = '4.2'

end
