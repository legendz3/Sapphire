module Sapphire
  module DSL
    module Browser
      def Transition(url)
        @browser.ShouldTransitionTo url
      end
    end
  end
end

