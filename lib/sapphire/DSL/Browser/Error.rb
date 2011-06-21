module Sapphire
  module DSL
    module Browser
      def Error(hash)
       ExecuteHashAgainstControl(hash) do |control, arg|
          control.Text.should == arg
        end
      end
    end
  end
end

