Pod::Spec.new do |s|
  s.name    = 'Benihime'
  s.version = '0.2.3'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'A collection of independent utility classes for iOS projects.'
  s.homepage = 'http://github.com/shiki/ios-benihime'
  s.authors = {
    'Shiki' => 'jayson@basanes.net',
    'timominous' => 'timominous@gmail.com'
  }

  s.source = {
    :git => 'https://github.com/shiki/ios-benihime.git',
    :tag => "#{s.version}"
  }
  s.platform = :ios, '7.0'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'MapKit'

  s.source_files = 'Benihime/**/*.{h,m}'
  s.preserve_paths = '*'
end
