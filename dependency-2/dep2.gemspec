
# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "dep2"
  spec.version     = "0.0.1"
  spec.summary     = "Depends on stuff to break higher-level deps"
  spec.license     = "public domain"
  spec.authors     = "Anonymous"

  spec.files       = ["empty.rb"]
  spec.bindir      = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_dependency 'does-not-exist', '= 1.0.0'
end
