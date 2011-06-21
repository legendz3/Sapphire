module Sapphire
  module WebAbstractions
    class Title < Control

      def Text
        @browser.title
      end

    end
  end
end

