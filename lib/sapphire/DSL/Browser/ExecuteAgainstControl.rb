module Sapphire
  module DSL
    module Browser
      def ExecuteHashAgainstControl(hash, &block)
        hash.keys.each do |key|
          @page.fields.each do |field|
            field.keys.each do |field_key|
              if(field_key == key)
                block.call(field[key], hash[key])
                return
              end
            end
          end
        end

        raise "cannot find control matching " + hash.to_s + " for page " + @page.to_s
      end

      def ExecuteAgainstControl(*args, &block)
        @page.fields.each do |field|
          field.keys.each do |field_key|
            args.each do |arg_array|
              arg_array.each do |arg|
                if(field_key == arg)
                  block.call(field[field_key], arg)
                  return
                end
              end
            end
          end
        end

        arglist = ""
        args.each do |arg_array|
          arg_array.each do |arg|
            arglist += arg.to_s + ", "
          end
        end

        raise "Cannot find controls matching: " + arglist + "for page " + @page.to_s
      end
    end
  end
end

