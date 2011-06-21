class Finally
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_reader :block
  attr_reader :text
  attr_reader :and
  attr_reader :parent
  attr_reader :results

  def initialize(parent, text, &block)
    @value = text
    @text = text.to_s
    @block = block
    @and = []
    @parent = parent
    @results = []
  end

  def add_and(pre, text, &block)
    if(self.value.is_a? Pending)
      self.and << And.new(self, Pending.new(pre + text), &block)
    else
      self.and << And.new(self, pre + text, &block)
    end
  end

  def AddResult(result)
    @results << result
  end

end