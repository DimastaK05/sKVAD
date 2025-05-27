module SymbolDiffPolynomialsBrackets::AST
  class Variable
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def diff(var)
      var == name ? Number.new(1) : Number.new(0)
    end

    def to_s
      name
    end
  end
end