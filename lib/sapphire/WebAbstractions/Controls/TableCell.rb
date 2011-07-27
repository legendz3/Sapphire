module Sapphire
  module WebAbstractions
    class TableCell < Control
      def Text
        text = self.Find
        text.value
      end
    end
  end
end