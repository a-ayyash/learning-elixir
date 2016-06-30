defmodule Counter.Server do
  def start(inital_count \\ 0) do
    spawn fn -> listen(inital_count) end
  end

  defp listen(count) do
    receive do 
      :inc -> listen(count + 1)
      :dec -> listen(count - 1)
      {sender, :val} -> 
        send sender, count
        listen(count)
    end
  end
end

defmodule Counter.Client do 
  def inc(pid) do send(pid, :inc) end
  def dec(pid) do send(pid, :dec) end
  def val(pid) do
    send(pid, {self, :val})
    receive do
      val -> val
    end
  end
end
