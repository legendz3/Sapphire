module Sapphire
  module DSL
    module Browser
      def IsVisible(args)
        @page.fields.each do |field|
          field.keys.each do |field_key|
            if(field_key == args)
              begin
                x = field[field_key].Find
                if(x)
                  begin
                    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
                    result = wait.until { y = x.displayed?
                      y unless y == false
                    }
                    return result
                  rescue
                    return false
                  end
                end
              rescue
               return false
              end
            end
          end
        end

        raise "cannot find control matching " + args.to_s + " for page " + @page.to_s
      end
    end
  end
end

