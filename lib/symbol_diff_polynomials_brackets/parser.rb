class Parser
  def initialize(expression)
    @tokens = expression.scan(/(\d+)|([a-z]+)|([+\-*\/^()])/i).flatten.compact
    @index = 0
  end

  def parse
    parse_expression
  end

  private

  def current_token
    @tokens[@index]
  end

  def consume
    @index += 1
  end

  def parse_expression
    node = parse_term
    while current_token =~ /[+-]/
      op = current_token
      consume
      node = Add.new(node, parse_term, op == "+")
    end
    node
  end

  def parse_term
    node = parse_factor
    while current_token =~ /[*\/]/
      op = current_token
      consume
      node = Multiply.new(node, parse_factor, op == "*")
    end
    node
  end

  def parse_factor
    node = parse_primary
    if current_token == "^"
      consume
      node = Power.new(node, parse_primary)
    end
    node
  end

  def parse_primary
    if current_token == "("
      consume
      node = parse_expression
      consume if current_token == ")"
      node
    elsif current_token =~ /\d/
      Number.new(current_token.to_f).tap { consume }
    else
      Variable.new(current_token).tap { consume }
    end
  end
end