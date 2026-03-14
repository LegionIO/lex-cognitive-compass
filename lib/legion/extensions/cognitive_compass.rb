# frozen_string_literal: true

require 'securerandom'

require_relative 'cognitive_compass/version'
require_relative 'cognitive_compass/helpers/constants'
require_relative 'cognitive_compass/helpers/bearing'
require_relative 'cognitive_compass/helpers/magnetic_bias'
require_relative 'cognitive_compass/helpers/compass_engine'
require_relative 'cognitive_compass/runners/cognitive_compass'
require_relative 'cognitive_compass/client'

module Legion
  module Extensions
    module CognitiveCompass
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
