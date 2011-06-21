module Sapphire
  module DSL
    module Browser
      def Navigate(page)
        @page = @browser.NavigateTo(page)
        @page.Init
      end
    end
  end
end

