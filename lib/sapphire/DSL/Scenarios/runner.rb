module Sapphire
  module DSL
    module Scenarios
      class Runner
        attr_accessor :scenarios

        def self.create
          @@instance ||= Runner.new
        end

        def self.instance
          @@instance ||= self.create
        end

        def initialize
          @scenarios = []
        end

        def add_scenario(scenario)
          @scenarios << scenario
        end

        def last_scenario
          @scenarios.last
        end
      end
    end
  end
end

