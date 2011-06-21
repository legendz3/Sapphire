module Sapphire
  module DSL
    module Data
      def Exist(value)
        value.should_not == nil
      end
    end
  end
end


