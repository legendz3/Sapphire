module Sapphire
  module DSL
    module Browser
      def Set(hash)
        ExecuteHashAgainstControl(hash) do |control, arg|
          control.Set arg
        end
      end
    end
  end
end

