defmodule Times do
  def double(a) do
    a * 2
  end

  def mul(a,b), do: a * b 

  def triple(a) do
    a * 3
  end

  def trimple(a), do: a * 3.2 

  def quadruple(a) do
    double(a) * double(a)
  end
end
