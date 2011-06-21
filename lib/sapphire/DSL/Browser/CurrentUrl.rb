module Sapphire
  module DSL
    module Browser
      def CurrentUrl(value)
        url = @browser.CurrentUrl
        url == value
      end
    end
  end
end

