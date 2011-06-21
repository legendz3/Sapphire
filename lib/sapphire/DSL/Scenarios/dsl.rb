module Sapphire
  module DSL
    module Scenarios
      def Background(text, &block)
        Runner.instance.last_scenario.add_background(Background.new(Runner.instance.last_scenario, "Assuming that ", text, &block))
      end

      def Given(text, &block)
        Runner.instance.last_scenario.add_given(Given.new(Runner.instance.last_scenario, "Given ", text, &block))
      end

      def When(text, &block)
        Runner.instance.last_scenario.last_given.add_when("When ", text, &block)
      end

      def Then(text, &block)
        Runner.instance.last_scenario.last_given.last_when.add_then("Then ", text, &block)
      end

      def And(text, &block)

        if(Runner.instance.last_scenario.last_given == nil && Runner.instance.last_scenario.last_background != nil)
          Runner.instance.last_scenario.add_background(Background.new(Runner.instance.last_scenario, "And ", text, &block))
          return
        end

        if(Runner.instance.last_scenario.last_given.finally != nil)
          Runner.instance.last_scenario.last_given.finally.add_and("And ", text, &block)
          return
        end

        if(Runner.instance.last_scenario.last_given.last_when == nil)
          Runner.instance.last_scenario.last_given.add_and("And ", text, &block)
          return
        end

        if(Runner.instance.last_scenario.last_given.last_when.last_then == nil)
          Runner.instance.last_scenario.last_given.last_when.add_and("And ", text, &block)
          return
        end

        if (Runner.instance.last_scenario.last_given.last_when.last_then != nil)
          Runner.instance.last_scenario.last_given.last_when.last_then.add_and("And ", text, &block)
        end
      end

      def Finally(text, &block)
        Runner.instance.last_scenario.last_given.add_finally(Finally.new(Runner.instance.last_scenario.last_given, text, &block))
      end

      def Scenario(text, &block)
        Runner.instance.add_scenario(Scenario.new(text, &block))
        #Runner.instance.last_scenario.block.call
        Runner.instance.last_scenario.execute 1
      end
    end
  end
end


