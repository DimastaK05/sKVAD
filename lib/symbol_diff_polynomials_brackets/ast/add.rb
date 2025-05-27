module SymbolDiff
  class Add
    attr_reader :left, :right
    
    def initialize(left, right)
      @left = left
      @right = right
    end
    
    def to_s
      "(#{left} + #{right})"
    end
    
    def diff(var)
      Add.new(left.diff(var), right.diff(var))
    end
    
  def expand
      Add.new(left.expand, right.expand)
    end
  end
end