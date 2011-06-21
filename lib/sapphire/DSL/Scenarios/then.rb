class Then
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_accessor :text
  attr_reader :block
  attr_reader :and
  attr_reader :parent
  attr_reader :results

  def initialize(parent, pre, text, &block)
    @block = block
    @value = text
    @text = pre + text.to_s
    @and = []
    @parent = parent
    @results = []
  end

  def add_and(pre, text, &block)
    if(!self.value.instance_of? Pending)
      x = Then.new(self, pre, text, &block)
      self.and << x
    else
      self.and << Then.new(self, pre, Pending.new(pre + text), &block)
    end
  end

  def AddResult(result)
    @results << result
    self.parent.results.last.AddChild(result)
  end

end