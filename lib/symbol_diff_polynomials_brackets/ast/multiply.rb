module SymbolDiffPolynomialsBrackets::AST
  class Multiply
    attr_reader :left, :right

    def initialize(left, right, multiply = true)
      @left = left
      @right = right
      @multiply = multiply
    end

    def diff(var)
      if @multiply
        Add.new(
          Multiply.new(left.diff(var), right),
          Multiply.new(left, right.diff(var))
        )
      else
        Divide.new(
          Subtract.new(
            Multiply.new(left.diff(var), right),
            Multiply.new(left, right.diff(var))
          ),
          Power.new(right, Number.new(2))
        )
      end
    end

    def to_s
      "#{left} #{@multiply ? '*' : '/'} #{right}"
    end
  end
end