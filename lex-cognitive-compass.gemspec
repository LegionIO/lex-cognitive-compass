# frozen_string_literal: true

require_relative 'lib/legion/extensions/cognitive_compass/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-cognitive-compass'
  spec.version       = Legion::Extensions::CognitiveCompass::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'Cognitive compass LEX — internal directional sense for decision-making'
  spec.description   = 'Maps cardinal directions to value axes (truth/utility/beauty/safety), ' \
                       'tracks magnetic declination from cognitive biases, and provides true ' \
                       'north calibration for aligned decision-making.'
  spec.homepage      = 'https://github.com/LegionIO/lex-cognitive-compass'

  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']      = spec.homepage
  spec.metadata['source_code_uri']   = spec.homepage
  spec.metadata['documentation_uri'] = "#{spec.homepage}#readme"
  spec.metadata['changelog_uri']     = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['bug_tracker_uri']   = "#{spec.homepage}/issues"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']
  spec.add_development_dependency 'legion-gaia'
end
