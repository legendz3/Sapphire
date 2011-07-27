require File.expand_path('../lib/sapphire.rb', File.dirname(__FILE__))

Scenario "Search something in google" do
    Given "opened up google in Firefox" do
      Start Firefox With "www.google.com"
    end
end