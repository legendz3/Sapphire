module Sapphire
  module DSL
    module Browser
      def Hide(args)
        return IsHidden(args) == true
      end
    end
  end
end

