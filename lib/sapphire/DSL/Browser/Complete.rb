module Sapphire
  module DSL
    module Browser
      def Complete(page)
        if(page.is_a? Class)
          x = page.new(@browser)
        else
          x = page
        end
        @page = x.Complete
      end
    end
  end
end

