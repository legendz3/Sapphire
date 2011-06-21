module Sapphire
  module WebAbstractions
    class CheckBox < Control
       def Check (value)

        if value && self.IsChecked
          return;
        end

        if !value && !self.IsChecked
          return;
        end

        radio = self.Find
        radio.click

      end

      def IsChecked

        radio = self.Find
        radio.attribute("checked");

      end
    end
  end
end

