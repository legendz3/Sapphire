module Sapphire
  module Testing
    class ScenarioResult

      attr_reader :results
      attr_accessor :myId
      attr_reader :type

      def initialize(text)
        @text = text
        @results = []
        @leaf = true
        @myId = -1
        @type = 'pass'
      end

      def AddChild(result)
        @results << result
      end

      def set_id(id)
        @myId = id
      end

      def set_type(type)
        @type = type
      end

    end
  end
end
