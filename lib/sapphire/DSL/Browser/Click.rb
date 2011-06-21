module Sapphire
  module DSL
    module Browser
      def Click(*args)
        ExecuteAgainstControl(args) do |control, arg|
          control.Click
        end
      end
    end
  end
end

