# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ccfg/version'

Gem::Specification.new do |spec|
  spec.name          = "ccfg"
  spec.version       = Ccfg::VERSION
  spec.authors       = ["Anton S.Gerasimov"]
  spec.email         = ["gera_box@mail.ru"]

  spec.summary       = %q{Command line tool to generate C/C++ configure files (config.h.in => config.h).}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/gera-gas/ccfg"
  spec.license       = "MIT"

  spec.files         = ["lib/ccfg.rb",
                        "lib/ccfg/version.rb",
                        "lib/ccfg/application.rb",
                        "lib/ccfg/handler.rb",
                     ]
  spec.bindir        = "bin"
  spec.executables   = "ccfg"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "cmdlib", "~> 1.0.0"
end
