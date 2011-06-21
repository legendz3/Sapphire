module Sapphire
  module Testing
    class ResultTree

      attr_accessor :results
      attr_accessor :type

      def initialize(text, result)

        @type = 'pass'
        @execution_time = 0

        if(result != nil)
          self.type = result.type
          @iconCls = "accept" if result.type == "pass"
          @iconCls = "delete" if result.type == "fail"
          @iconCls = "error" if result.type == "pending"
          @execution_time = result.execution_time
          @expanded = true
          @message = result.message
          @stack = result.stack
        end
        @text = text
        @results = []
        @leaf = true

      end

      def AddChild(node)
        @results << node
        @leaf = false
      end

    end
  end
end

