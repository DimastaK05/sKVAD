module SymbolDiff
  class Power
    attr_reader :base, :exponent
    
    def initialize(base, exponent)
      @base = base
      @exponent = exponent
    end
    
    def to_s
      "(#{base})^#{exponent}"
    end
    
    def diff(var)
      Multiply.new(
        Multiply.new(exponent, Power.new(base, exponent - 1)),
        base.diff(var)
      )
    end
    
    def expand

      return self unless exponent.is_a?(Number) && exponent.value.to_i == exponent.value

      n = exponent.value.to_i

      return Number.new(1) if n == 0


      return base.expand if n == 1

      
      expanded_base = base.expand
      (n - 1).times.reduce(expanded_base) do |acc|
        Multiply.new(acc, expanded_base).expand
      end
    end
  end
end