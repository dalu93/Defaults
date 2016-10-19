Pod::Spec.new do |s|
    s.name = 'Defaults.swift'
    s.version = '2.0.0'
    s.license = 'MIT'
    s.summary = 'Easy to use UserDefaults for iOS apps.'
    s.homepage = 'https://github.com/dalu93/Defaults'
    s.social_media_url = 'https://twitter.com/DAlbertiLuca'
    s.authors = { 'dalu93' => 'dalberti.luca93@gmail.com' }
    s.source = { :git => 'https://github.com/dalu93/Defaults.git', :tag => s.version }

    s.ios.deployment_target = '8.0'
    s.osx.deployment_target = '10.10'
    s.tvos.deployment_target = '9.0'
    s.watchos.deployment_target = '2.0'

    s.source_files = 'Sources/*.swift'
end
