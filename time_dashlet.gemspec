# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_dashlet/version'

Gem::Specification.new do |spec|
  spec.name          = 'time_dashlet'
  spec.version       = TimeDashlet::VERSION
  spec.authors       = ['Mate Farkas']
  spec.email         = ['mate.farkas@sch.hu']

  spec.summary       = 'Show current time in UTC'
  spec.homepage      = 'https://github.com/farkasmate/rubygem-time_dashlet'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/|(\.dockerignore|Dockerfile|docker-compose\.yaml)}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.74'

  spec.add_runtime_dependency 'sinatra', '~> 2.0'
  spec.add_runtime_dependency 'unicorn', '~> 5.5'
end
