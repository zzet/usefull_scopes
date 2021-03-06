# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "usefull_scopes/version"

Gem::Specification.new do |s|
  s.name        = "usefull_scopes"
  s.version     = UsefullScopes::VERSION
  s.authors     = ["Kaize Team"]
  s.email       = ["info@kaize.ru"]
  s.homepage    = "http://github.com/kaize/usefull_scopes"
  s.summary     = "Additional scopes for Active:Record models."
  s.description = "This gem provides additional scopes for your Active:Record models within Ruby on Rails framework."

  s.rubyforge_project = "usefull_scopes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.require_paths = ["lib"]
end
