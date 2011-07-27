module Sapphire
  module DSL
    module Browser
      def Error(hash)
       ExecuteHashAgainstControl(hash) do |control, arg|
          return control.Text == arg
        end
      end
    end
  end
end

