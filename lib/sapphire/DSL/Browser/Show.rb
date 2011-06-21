module Sapphire
  module DSL
    module Browser
      def Show(item)

        if(item.is_a? Hash)
           ExecuteHashAgainstControl(item) do |control, arg|
            control.Text.should == arg
           end
          return
        elsif(item.is_a? Symbol)
          IsVisible(item).should == true
          return
        elsif(item.is_a? Class)
          @page = @browser.ShouldNavigateTo item
          sleep(1)
        else
          @page = item
        end

        @page.Init
      end
    end
  end
end

