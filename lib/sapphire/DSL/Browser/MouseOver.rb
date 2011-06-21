module Sapphire
  module DSL
    module Browser
      def MouseOver(*args)
        ExecuteAgainstControl(args) do |control, arg|
          control.MouseOver
        end
      end
    end
  end
end

