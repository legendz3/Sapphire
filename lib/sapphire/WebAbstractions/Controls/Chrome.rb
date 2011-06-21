module Sapphire
  module WebAbstractions
    def Chrome(url)
      ChromeBrowser.new
    end

    class ChromeBrowser < DelegateClass(Selenium::WebDriver::Chrome::Bridge)
      include WebBrowser

      attr_reader :browser

      def initialize()
        @browser = Selenium::WebDriver.for :chrome
        super @browser
        $browser = @browser
      end
    end
  end
end


