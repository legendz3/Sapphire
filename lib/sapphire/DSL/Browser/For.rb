module Sapphire
  module DSL
    module Browser
      def For(item)
        {item => GetPageField(item).Text}
      end
    end
  end
end

