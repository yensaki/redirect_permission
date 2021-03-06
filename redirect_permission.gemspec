
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "redirect_permission/version"

Gem::Specification.new do |spec|
  spec.name          = "redirect_permission"
  spec.version       = RedirectPermission::VERSION
  spec.authors       = ["yensaki"]
  spec.email         = ["mov.an.double@gmail.com"]

  spec.summary       = %q{Check an arbitary URL is permitted as redirect_url}
  spec.description   = %q{Check an arbitary URL is permitted as redirect_url}
  spec.homepage      = "https://github.com/yensaki/redirect_permission"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
