require File.expand_path('../../Testing/Executable', File.dirname(__FILE__))

class And
  include Sapphire::Testing::Executable

  attr_reader :text
  attr_reader :block
  attr_reader :value
  attr_reader :parent
  attr_reader :results

  def initialize(parent, text, &block)
    @block = block
    @text = text.to_s
    @value = text
    @parent = parent
    @results = []
  end

  def AddResult(result)
    @results << result
    self.parent.results.last.AddChild(result)
  end

end