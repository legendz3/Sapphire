module Sapphire
  module DSL
    module Browser
      def Reload(item)
        @browser.Reload
        Should Show item
      end
    end
  end
end

