module Sapphire
  module DSL
    module Configuration
      def ConfiguredBrowser(url)
        @rootUrl = url
        ConfigurationBrowser
      end

      class ConfigurationBrowser
      end
    end
  end
end