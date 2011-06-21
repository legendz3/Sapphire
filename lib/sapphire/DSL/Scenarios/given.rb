class Given
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_reader :text
  attr_reader :block
  attr_reader :finally
  attr_reader :when
  attr_reader :and
  attr_reader :parent
  attr_reader :results

  def initialize(parent, pre, text, &block)
    @value = text
    @text = pre + text.to_s
    @block = block
    @when = []
    @and = []
    @parent = parent
    @results = []
  end

  def add_when(pre, text, &block)
    if(self.value.is_a? Pending)
      @when << When.new(self, pre, Pending.new(text), &block)
    else
      x = When.new(self, pre, text, &block)
      @when << x
    end
  end

  def last_when()
    @when.last
  end

  def add_finally(finally)
    if(self.value.is_a? Pending)
      @finally = Finally.new(self, Pending.new(finally.text), &block)
    else
      @finally = finally
    end
  end

  def add_and(pre, text, &block)
    if(self.value.is_a? Pending)
      self.and << And.new(self, Pending.new(pre + text), &block)
    else
      self.and << And.new(self, text, &block)
    end
  end

  def AddResult(result)
    @results << result
    self.parent.result.AddChild(result)
  end

end