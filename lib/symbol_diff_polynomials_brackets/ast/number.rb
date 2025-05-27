module SymbolDiffPolynomialsBrackets::AST
  class Number
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def diff(*)
      Number.new(0)
    end

    def to_s
      value.to_s
    end
  end
end