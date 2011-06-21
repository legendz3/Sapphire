module Sapphire
  module WebAbstractions
    def InternetExplorer(url)
      driver = InternetExplorerBrowser.new
      driver
    end

    class InternetExplorerBrowser < DelegateClass(Selenium::WebDriver::IE::Bridge)
      include WebBrowser

      attr_reader :browser

      def initialize
        #@browser = Selenium::WebDriver.for :ie
        super(@browser)
        $browser = @browser
      end
    end
  end
end

