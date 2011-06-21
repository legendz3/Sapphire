module Sapphire
  module DSL
    module Scenarios
      class Scenario
        include Sapphire::Testing::RSpecRunner

        attr_reader :block
        attr_reader :value
        attr_reader :text
        attr_reader :givens
        attr_reader :backgrounds
        attr_reader :result

        def initialize(text, &block)
          @value = text
          @text = text.to_s
          @block = block
          @givens = []
          @backgrounds = []
          @result = Testing::ScenarioResult.new(text)
        end

        def add_given(given)
          if(self.value.is_a? Pending)
            @givens << Given.new(self, "", Pending.new(given.text), &block)
          else
            @givens << given
          end
        end

        def last_given
          @givens.last
        end

        def add_background(background)
          if(self.value.is_a? Pending)
            @backgrounds << Background.new(self, "", Pending.new(background.text), &block)
          else
            @backgrounds << background
          end
        end

        def last_background
          @backgrounds.last
        end

      end
    end
  end
end

