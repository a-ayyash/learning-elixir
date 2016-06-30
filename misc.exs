defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end

defmodule Sum do
  def off([]), do: 0
  def off [h|t] do 
    h + off(t)
  end
end

defmodule GCD do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x,y))
end

defmodule Default_Parameters do 
  def func(p1, p2 \\ 10, p3 \\ 100, p4) do 
    IO.puts(p1)
    IO.puts(p2)
    IO.puts(p3)
    IO.puts(p4)
  end

  #this is a conflict with the above function
  #since they both can have arity of 2
  #def func(p1,p1) do
  #end
end

#defmodule DefaultParams do
  #def func(p1, p2 \\ 123) do
    #IO.inspect [p1, p2]
  #end

  #this will also generate a warning
  #def func(p1, 99) do
    #IO.puts "You said 99"
  #end
#end


defmodule Chop do
  def guess(actual, first..last) do
    IO.puts("is it #{div(first+last, 2)}")

    process(actual, div(first+last, 2), first..last)
  end

  def process(p, mid, first..last) when p > mid do
    guess(p, mid..last)
  end

  def process(p, mid, first..last) when p < mid do
    guess(p, first..mid)
  end

  def process(guess, mid, _.._) when guess == mid do
    IO.puts(guess)
  end
end


defmodule Lizt do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([head|tail]), do: [head+1|add_1(tail)]

  #a more general for of these is map
  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)

  def reduce(list, func), do: _reduce(list, func, 0)
  defp _reduce([], _func, total), do: total
  defp _reduce([head|tail], func, total), do: _reduce(tail, func, func.(head, total))

  def mapsum(list, fun), do: _mapsum(list, fun, 0)
  defp _mapsum([], _fun, total), do: total
  defp _mapsum([head|tail], fun, total), do: _mapsum(tail, fun, fun.(head) + total)

  def max([head|tail]), do: _max(head, [head|tail])
  defp _max(mx, []), do: mx
  defp _max(mx, [head|tail]) when mx >= head, do: _max(mx, tail)
  defp _max(mx, [head|tail]) when mx < head, do: _max(head, tail)

  def span(from, to) when from < to, do: _span([from | [from+1]], from+1, to)
  defp _span(rest = [head|tail], tto, to) when tto < to, do: _span(rest ++ [tto+1], tto+1,to)
  defp _span(inter, tto, to) when tto == to, do: inter 
end

defmodule Caesar do
  def caesar([], key), do: []
  def caesar([head|tail], key), do: [head+key | caesar(tail, key)]
end

