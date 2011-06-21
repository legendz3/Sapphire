module Sapphire
  module WebAbstractions
    class TextBox < Control

      def Text= (value)
        text = self.Find
        text.send_keys value
      end

      def Text
        text = self.Find
        text.text
      end

      def Set(value)
        if(value == "")
          self.Clear
        else
          text = self.Find
          text.send_keys value
        end
      end

      def Clear
        text = self.Find
        text.clear
      end
    end
  end
end

