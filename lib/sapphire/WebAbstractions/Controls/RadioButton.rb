module Sapphire
  module WebAbstractions
    class RadioButton < Control

      def Text
        self.Find().text
      end

      def Check (value)

        radio = self.Find
        radio.click

      end
    end
  end
end

