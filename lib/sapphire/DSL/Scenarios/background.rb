class Background
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_reader :text
  attr_reader :block
  attr_reader :parent
  attr_reader :results

  def initialize(parent, pre, text, &block)
    @block = block
    @value = text
    @text = pre + text.to_s
    @parent = parent
    @results = []
  end

  def AddResult(result)
    @results << result
    self.parent.result.AddChild(result)
  end

end