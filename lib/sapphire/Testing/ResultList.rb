module Sapphire
  module Testing
    class ResultsList

      attr_reader :myId
      attr_reader :text
      attr_reader :children

      def initialize(text, results, id)
        @myId = id
        @text = text
        @children = results
        @expanded = true
        @count = results.length
      end

    end
  end
end