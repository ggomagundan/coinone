# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coinone/version'

Gem::Specification.new do |spec|
  spec.name          = "coinone"
  spec.version       = Coinone::VERSION
  spec.authors       = ["Kai Park"]
  spec.email         = ["ggogun@gmail.com"]

  spec.summary       = %q{Wrapping for coinone.co.kr API}
  spec.description   = %q{Wrapping for coinone.co.kr API}
  spec.homepage      = %q{https://github.com/ggomagundan/coinone}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

=begin
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
=end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.15', '>= 1.15.0'
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "dotenv", "~> 2.2"
  spec.add_development_dependency "faraday", "~> 0.12.1"

  spec.add_runtime_dependency "json",  '~> 2.1', '>= 2.1.0'
  spec.add_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
  spec.add_dependency 'addressable', '~> 2.5'
end
