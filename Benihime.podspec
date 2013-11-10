Pod::Spec.new do |s|
  s.name    = 'Benihime'
  s.version = '0.1.0'
  s.summary = ''
  s.authors = {
    'Shiki' => 'bj@basanes.net'
  }
  s.source = {
    :git => 'https://github.com/shiki/ios-benihime.git',
    :tag => "#{s.version}"
  }
  s.source_files = 'Benihime/**/*.{h,m}'
  s.requires_arc = true
  s.preserve_paths = '*'
end
