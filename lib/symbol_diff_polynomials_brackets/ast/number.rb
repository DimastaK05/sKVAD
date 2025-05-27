module SymbolDiff
  class Number
    attr_reader :value
    
    def initialize(value)
      @value = value.to_f
    end
    
    def to_s
      value.to_s
    end
    
    def diff(_)
      Number.new(0)
    end
    
    def expand
      self
    end
  end
end