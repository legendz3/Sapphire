module Sapphire
  module WebAbstractions
    class Control
      def initialize(browser, hash)
          @browser = browser
          @hash = hash
      end

      def Find
        if(@hash.has_key?(:id))
          FindBy :id
        elsif (@hash.has_key?(:name))
          FindBy :name
        elsif (@hash.has_key?(:xpath))
          FindBy :xpath
        end
      end

      def FindWithoutWait
        if(@hash.has_key?(:id))
          FindWithoutWaitBy :id
        elsif (@hash.has_key?(:name))
          FindWithoutWaitBy :name
        elsif (@hash.has_key?(:xpath))
          FindWithoutWaitBy :xpath
        end
      end

      def FindWithoutWaitBy(symbol)
        @browser.find_element symbol, @hash.fetch(symbol)
      end

      def FindBy(symbol)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        element = wait.until { x = @browser.find_element symbol, @hash.fetch(symbol)
            x
        }
      end

      def FindParent(hash)
        if(hash.has_key?(:id))
          @browser.find_element :id, hash.fetch(:id)
        elsif (hash.has_key?(:name))
          @browser.find_element :name, hash.fetch(:name)
        elsif (hash.has_key?(:xpath))
          @browser.find_element :xpath, hash.fetch(:xpath)
        end
      end

      def Text
        text = self.Find
        text.text
      end

      def Click
        control = self.Find
        control.click
      end

      def MouseOver
        if(@hash.has_key?(:id))
          @browser.execute_script("document.getElementById('"+ @hash.fetch(:id) +"').style.visibility = 'visible'; ")
        elsif (@hash.has_key?(:name))
          @browser.execute_script("document.getElementById('"+ @hash.fetch(:name) +"').style.visibility = 'visible'; ")
        elsif (@hash.has_key?(:xpath))
          @browser.execute_script("document.evaluate( '" + @hash.fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
        end
        sleep(1)
      end
    end
  end
end


