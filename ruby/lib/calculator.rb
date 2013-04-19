class Calculator
  def add(*x)
    x.reduce :+
  end
end
