module Sapphire
  module DSL
    module Browser
      def Track(hash)
        $tracker ||= {}
        $tracker.merge! hash
      end

      def Tracker(item)
        $tracker[item]
      end
    end
  end
end

