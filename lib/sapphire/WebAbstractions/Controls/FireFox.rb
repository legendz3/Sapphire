module Sapphire
  module WebAbstractions
    class FireFoxBrowser < DelegateClass(Selenium::WebDriver::Firefox::Bridge)
      include WebBrowser

      attr_reader :browser

      def initialize()
        @browser = Selenium::WebDriver.for :firefox
        super(@browser)
        $browser = @browser
      end

    end

    def FireFox(url)
      FireFoxBrowser.new
    end
  end
end


