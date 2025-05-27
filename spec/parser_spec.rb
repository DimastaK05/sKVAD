require 'spec_helper'

RSpec.describe SymbolDiffPolynomialsBrackets::Parser do
  describe "#parse" do
    it "parses (x + 2)^3" do
      expr = described_class.new("(x + 2)^3").parse
      expect(expr.to_s).to eq("(x + 2.0)^3.0")
    end
  end
end
