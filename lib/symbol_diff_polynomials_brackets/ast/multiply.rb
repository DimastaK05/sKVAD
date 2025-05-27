module SymbolDiff
  class Multiply
    attr_reader :left, :right
    
    def initialize(left, right)
      @left = left
      @right = right
    end
    
    def to_s
      "(#{left} * #{right})"
    end
    
    def diff(var)
      Add.new(
        Multiply.new(left.diff(var), right),
        Multiply.new(left, right.diff(var))
      )
    end
    
    def expand
      left_exp = left.expand
      right_exp = right.expand
      # Реализация раскрытия скобок
    end
  end
end