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

  
    if left_exp.is_a?(Add)
      Add.new(
        Multiply.new(left_exp.left, right_exp).expand,
        Multiply.new(left_exp.right, right_exp).expand
      )

 
    elsif right_exp.is_a?(Add)
      Add.new(
        Multiply.new(left_exp, right_exp.left).expand,
        Multiply.new(left_exp, right_exp.right).expand
      )

  
    else
      Multiply.new(left_exp, right_exp)
      end
    end
  end
end