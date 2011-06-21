module Sapphire
  module DSL
    module Data
      def GetPageField(key)
        @page.fields.each do |field|
          field.keys.each do |field_key|
            if(field_key == key)
              return field[key]
            end
          end
        end
        raise "Could not find control for: " + key + " for page " + @page.to_s
      end
    end
  end
end

