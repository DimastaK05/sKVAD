require_relative "symbol_diff_polynomials_brackets/version"
require_relative "symbol_diff_polynomials_brackets/parser"
require_relative "symbol_diff_polynomials_brackets/polynomial"
require_relative "symbol_diff_polynomials_brackets/monomial"

module SymbolDiffPolynomialsBrackets
  class Symdiff
    def self.parse(expression)
      Parser.new(expression).parse
    end
  end
end