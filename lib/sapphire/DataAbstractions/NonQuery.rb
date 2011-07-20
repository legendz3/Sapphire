module Sapphire
  module DataAbstractions
    module NonQuery
      def Execute
          x = self.Database.new

          x.Open $config[x.Connection]

          path = File.expand_path(self.Script, __FILE__)
          file = File.open(path)
          contents = file.read
          self.Tokenize(contents)

          x.query(contents)
          x.close
        end
      end
  end
end