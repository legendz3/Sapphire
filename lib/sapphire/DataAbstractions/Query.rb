module Sapphire
  module DataAbstractions
    module Query
      def Execute(block)
          x = self.Database.new

          x.Open $config[x.Connection]

          path = File.expand_path(self.Script, __FILE__)
          file = File.open(path)
          contents = file.read
          self.Tokenize(contents)

          results = x.query(contents)
          block.call results
          x.close
        end
      end
  end
end