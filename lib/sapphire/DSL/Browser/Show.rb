module Sapphire
  module DSL
    module Browser
      def Show(item)
        sleep(0.5)
        if(item.is_a? Hash)
          ExecuteHashAgainstControl(item) do |control, arg|
            return control.Text == arg
          end
        elsif(item.is_a? Symbol)
          return IsVisible(item) == true
        elsif(item.is_a? Class)
          temp, @page = @browser.ShouldNavigateTo item
          sleep(1.5)
          @page.Init
          return temp
        else
          @page = item
          @page.Init
          return true
        end

      end
    end
  end
end

