module SymbolDiff
  class Parser
    def initialize(expression)
      @tokens = expression.scan(/[+\-*\/\^()]|\d+\.?\d*|\w+/)
      @pos = 0
    end

    def parse
      parse_expression
    end

    private

    def current_token
      @tokens[@pos]
    end

    def consume
      @pos += 1
    end

    def parse_primary
      if current_token == '('
        consume
        expr = parse_expression
        consume if current_token == ')'
        expr
      elsif current_token =~ /\d/
        Number.new(current_token).tap { consume }
      else
        Variable.new(current_token).tap { consume }
      end
    end

    def parse_power
      left = parse_primary
      while current_token == '^'
        consume
        right = parse_primary
        left = Power.new(left, right)
      end
      left
    end

    def parse_term
      left = parse_power
      while current_token =~ /[*/]/
        op = current_token
        consume
        right = parse_power
        left = op == '*' ? Multiply.new(left, right) : Divide.new(left, right)
      end
      left
    end

    def parse_expression
      left = parse_term
      while current_token =~ /[+-]/
        op = current_token
        consume
        right = parse_term
        left = Add.new(left, right, op == '+')
      end
      left
    end
  end
end