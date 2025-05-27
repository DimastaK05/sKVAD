module SymbolDiff
  class Variable
    attr_reader :name
    
    def initialize(name)
      @name = name.to_sym
    end
    
    def to_s
      name.to_s
    end
    
    def diff(var)
      var == name ? Number.new(1) : Number.new(0)
    end
    
    def expand
      self
    end
  end
end