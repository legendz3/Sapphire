require File.expand_path('../../lib/sapphire.rb', __FILE__)

Scenario "Search something in google" do
    Given "opened up google in Firefox" do
      @browser = Using FireFox("www.google.com")
    end
end