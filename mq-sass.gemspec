$:.push File.expand_path("../lib", __FILE__)
require "mq-sass/version"

Gem::Specification.new do |spec|
  spec.name        = "mq-sass"
  spec.version     = MQSass::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Jonathan Suh"]
  spec.email       = ["hello@jonsuh.com"]
  spec.homepage    = "https://jonsuh.com/mq-sass"
  spec.summary     = "Sass library to manage responsive breakpoints"
  spec.description = "Sass library to manage responsive breakpoints to generate media queries"
  spec.license     = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]
end
