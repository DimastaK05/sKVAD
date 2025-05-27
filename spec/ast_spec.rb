require 'spec_helper'

RSpec.describe SymbolDiff::Power do
  describe "#expand" do
    it "expands (x + 2)^2" do
      x = SymbolDiff::Variable.new(:x)
      two = SymbolDiff::Number.new(2)
      power = described_class.new(SymbolDiff::Add.new(x, two), SymbolDiff::Number.new(2))
      expect(power.expand.to_s).to include("x * x", "x * 2", "2 * x", "2 * 2")
    end
  end
end