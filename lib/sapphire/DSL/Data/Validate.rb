module Sapphire
  module DSL
    module Data
      def Validate(hash)
        hash.keys.each do |key|
          if(hash[key].is_a? Symbol)
            key.to_s.should == GetPageField(hash[key]).Text
          else
            key.to_s.should == hash[key].to_s
          end
        end
      end
    end
  end
end

