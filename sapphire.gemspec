# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sapphire/version"

Gem::Specification.new do |s|
  s.name        = "sapphire"
  s.version     = Sapphire::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcus Bratton"]
  s.email       = ["marcus.bratton@gmail.com"]
  s.homepage    = ""
  s.summary     = "An automated web acceptance test framework for non-technical resources"
  s.description = "An automated web acceptance test framework for non-technical resources"
  s.files       = Dir['lib/**/*.rb']
  s.has_rdoc    = false
  s.require_paths = ["lib"]
end
