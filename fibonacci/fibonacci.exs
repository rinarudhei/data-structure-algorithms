defmodule Fibonacci do
  def fib(n) when not is_integer(n), do: {:error, :not_an_integer}
  def fib(n) when n <= 0, do: {:error, :not_positive_input}

  def fib(n) do
    memo = %{}
    {_, result, _} = do_fib(n, memo)
    {:ok, result}
  end

  defp do_fib(n, memo) when n in [1, 2] do
    {:ok, 1, Map.put(memo, n, 1)}
  end

  defp do_fib(n, memo) when is_map_key(memo, n), do: {:ok, memo[n], memo}

  defp do_fib(n, memo) do
    {:ok, fib_n_minus_2, memo_1} = do_fib(n - 2, memo)
    {:ok, fib_n_minus_1, memo_2} = do_fib(n - 1, memo_1)
    result = fib_n_minus_2 + fib_n_minus_1
    {:ok, result, Map.put(memo_2, n, result)}
  end
end

ExUnit.start()

defmodule FibonacciTest do
  use ExUnit.Case, async: true
  # 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 
  test "Fibonacci -1" do
    assert Fibonacci.fib(-1) === {:error, :not_positive_input}
  end

  test "Fibonacci 0" do
    assert Fibonacci.fib(0) === {:error, :not_positive_input}
  end

  test "Fibonacci abc" do
    assert Fibonacci.fib("abc") === {:error, :not_an_integer}
  end

  test "Fibonacci 1" do
    assert Fibonacci.fib(1) === {:ok, 1}
  end

  test "Fibonacci 2" do
    assert Fibonacci.fib(2) === {:ok, 1}
  end

  test "Fibonacci 5" do
    assert Fibonacci.fib(5) === {:ok, 5}
  end

  test "Fibonacci 10" do
    assert Fibonacci.fib(10) === {:ok, 55}
  end
end
