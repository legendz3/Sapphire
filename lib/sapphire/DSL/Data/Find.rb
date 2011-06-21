module Sapphire
  module DSL
    module Data
      def Find(query, &block)
        query.Execute block
      end
    end
  end
end

