# frozen_string_literal: true

require_relative "lib/kwyktree/version"

Gem::Specification.new do |spec|
  spec.name          = "kwyktree"
  spec.version       = KwykTree::VERSION
  spec.authors       = ["David Crosby"]
  spec.email         = ["dave@dafyddcrosby.com"]

  spec.summary       = "Know-What-You-Know Tree"
  spec.description   = spec.summary
  spec.homepage      = "https://daveops.net"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-graphviz", "~> 1.2"
  spec.metadata["rubygems_mfa_required"] = "true"
end
