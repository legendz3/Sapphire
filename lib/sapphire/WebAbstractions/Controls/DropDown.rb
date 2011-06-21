module Sapphire
  module WebAbstractions
    class DropDown < Control
      def Selected= (value)
        text = self.Find
        text.send_keys value
      end

      def Selected
        text = self.Find
        text.value
      end

      def Set(value)
        text = self.Find
        text.send_keys value
      end
    end
  end
end





