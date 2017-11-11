lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'party_parrot/version'

Gem::Specification.new do |spec|
  spec.name          = "party-parrot-formatter"
  spec.version       = PartyParrot::VERSION
  spec.authors       = ["Jaroslaw Rodak"]
  spec.email         = ["jaroslaw.rodak@gmail.com"]

  spec.summary       = "Party parrot RSpec formatter"
  spec.license       = "Beerware"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rspec', '>= 3.0', '< 4'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print"
end
