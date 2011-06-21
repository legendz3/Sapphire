module Sapphire
  module DSL
    module Browser
      def IsHidden(args)
        @page.fields.each do |field|
          field.keys.each do |field_key|
            if(field_key == args)
              begin
                wait = Selenium::WebDriver::Wait.new(:timeout => 10)
                element = wait.until { x = field[field_key].Find
                    x and !x.displayed?
                }
                if(element)
                  return element.displayed?
                end
              rescue
               return true
              end
            end
          end
        end

        raise "cannot find control matching " + args.to_s + " for page " + @page.to_s
      end
    end
  end
end

