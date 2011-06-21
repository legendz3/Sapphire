require "test/unit"
require "rubygems"
require "rspec"
require 'yaml'
require 'selenium-webdriver'
require 'delegate'
require 'Forwardable'
require 'win32ole'
require 'json'

Dir[File.dirname(__FILE__) + '/sapphire/Testing/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/WebAbstractions/Controls/Base/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/WebAbstractions/Controls/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DataAbstractions/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Browser/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Configuration/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Data/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Scenarios/*.rb'].each {|file| require file }

module Sapphire
  module Sapphire
    include DSL::Scenarios
    include DSL::Browser
    include DSL::Configuration
    include DSL::Data
    include DataAbstractions
    include WebAbstractions
    include Testing
  end
end