module SymbolDiffPolynomialsBrackets::AST
  class Add
    attr_reader :left, :right

    def initialize(left, right, positive = true)
      @left = left
      @right = right
      @positive = positive
    end

    def diff(var)
      Add.new(left.diff(var), right.diff(var), @positive)
    end

    def to_s
      "#{left} #{@positive ? '+' : '-'} #{right}"
    end
  end
end