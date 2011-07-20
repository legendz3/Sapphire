module Sapphire
  module DSL
    module Popup
      class Popup
        def Close
          @browser.switch_to.window(@browser.window_handles.last)
          @browser.close
          @browser.switch_to.window(@browser.window_handles[0])
        end
      end
    end
  end
end