module Sapphire
  module DSL
    module Scenarios
      def Pending(text)
        Pending.new text
      end

      class Pending

        attr_reader :text
        attr_reader :and

        def initialize(text)
          @text = text
          @and = []
        end

        def add_and(text, &block)
          self.and << Then.new(text, &block)
        end

        def to_s
          self.text
        end

      end
    end
  end
end