module Sapphire
  module DSL
    module Browser
      def Uncheck(*args)
        ExecuteAgainstControl(args) do |control, arg|
          control.Check false
        end
      end
    end
  end
end

