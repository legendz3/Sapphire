module Sapphire
  module DSL
    module Browser
      def Hide(args)
        IsHidden(args).should == true
      end
    end
  end
end

