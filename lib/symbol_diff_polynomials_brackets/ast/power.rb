module SymbolDiffPolynomialsBrackets::AST
  class Power
    attr_reader :base, :exponent

    def initialize(base, exponent)
      @base = base
      @exponent = exponent
    end

    def expand
      Multiply.new(base.expand, base.expand) # Упрощенный пример для (a + b)^2
    end

    def to_s
      "(#{base})^#{exponent}"
    end
  end
end