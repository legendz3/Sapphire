module Sapphire
  module DSL
    module Browser
      def Should(item)
        item.should == true
      end
    end
  end
end

