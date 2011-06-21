module Sapphire
  module DSL
    module Configuration
      def Use(user)
        if(user == ConfiguredUser)
          $user = AppConfig.new().User
        else
          $user = user.new
        end
      end
    end
  end
end


