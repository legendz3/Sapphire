module Sapphire
  module DSL
    module Data
      def Write(query)
        query.Execute
      end
    end
  end
end