module Sapphire
  module DSL
    module Browser
      def Start(browser)
        if(browser == ConfigurationBrowser)
          @browser = AppConfig.Current.Browser
        else
          @browser = browser
        end

        @browser.SetRootUrl(@rootUrl)
      end
    end
  end
end

