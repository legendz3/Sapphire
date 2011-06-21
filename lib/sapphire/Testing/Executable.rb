module Sapphire
  module Testing
    module Executable
      def execute(id)
        start = Time.now
        begin
          if(self.value.is_a? Pending)
            self.AddResult(ResultTree.new(self.text, TestResult.new("pending", self.text, "Pending", "", Time.now - start, id)))
            puts "(pending) " + self.text + " (" + (Time.now - start).to_s + "s)"
            return
          end
          self.block.call
          self.AddResult(ResultTree.new(self.text, TestResult.new("pass", self.text, "Success", "", Time.now - start, id)))
          puts "(pass) " + self.text + " (" + (Time.now - start).to_s + "s)"
        rescue => msg

          stack = ""
          msg.backtrace.each do |line|
            stack += "\r\n" + line
          end

          self.AddResult(ResultTree.new(self.text, TestResult.new("fail", self.text, msg.message, stack, Time.now - start, id)))
          puts "(fail) " + self.text + ": " + msg.message + " (" + (Time.now - start).to_s + "s)"
        end
      end
      @result
    end
  end
end

