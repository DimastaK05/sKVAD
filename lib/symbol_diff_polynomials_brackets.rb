require_relative "symbol_diff_polynomials_brackets/parser"
require_relative "symbol_diff_polynomials_brackets/ast/add"
require_relative "symbol_diff_polynomials_brackets/ast/multiply"
require_relative "symbol_diff_polynomials_brackets/ast/number"
require_relative "symbol_diff_polynomials_brackets/ast/power"
require_relative "symbol_diff_polynomials_brackets/ast/variable"

module SymbolDiffPolynomialsBrackets
  class Symdiff
    def self.parse(expression)
      Parser.new(expression).parse
    end
  end
end
