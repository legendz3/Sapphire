module Sapphire
  module DSL
    module Browser
      def Exists(symbol)
        @page.fields.each do |field|
          field.keys.each do |field_key|
            if(field_key == symbol)
              begin
                x = field[field_key].FindWithoutWait
                return x.displayed?
              rescue
                return false
              end
            end
          end
        end
        false
      end
    end
  end
end

