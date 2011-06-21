module Sapphire
  module DSL
    module Configuration
      def configured_user
        $user
      end
      class ConfiguredUser
      end
    end
  end
end