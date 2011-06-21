module Sapphire
  module DSL
    module Browser
      def Exit(item)
        x = item.new
        x.Close
      end
    end
  end
end


