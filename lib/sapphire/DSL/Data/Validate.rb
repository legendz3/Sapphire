module Sapphire
  module DSL
    module Data
      def Validate(hash)
        hash.keys.each do |key|
          if(hash[key].is_a? Symbol)
            return key.to_s == GetPageField(hash[key]).Text
          else
            return key.to_s == hash[key].to_s
          end
        end
      end
    end
  end
end

