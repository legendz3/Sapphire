module Sapphire
  module DSL
    module Browser
      def Check(*args)
        ExecuteAgainstControl(args) do |control, arg|
          control.Check true
        end
      end
    end
  end
end

