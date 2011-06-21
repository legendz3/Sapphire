module Sapphire
  module DSL
    module Browser
      class Browser
        def Close
          sleep(2)
          $browser.close
        end
      end
    end
  end
end

