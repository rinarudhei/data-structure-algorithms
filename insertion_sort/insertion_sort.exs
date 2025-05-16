defmodule InsertionSort do
  @doc """
    Receive a list of integer, sort it using insertion sort algorithm,
    return {:ok, result} | {:error, :not_a_list} | {:error, :not_integer}
  """
  @spec sort(list(integer())) ::
          {:ok, list(integer())} | {:error, :not_a_list} | {:error, :not_integer}
  def sort(arr) when not is_list(arr), do: {:error, :not_a_list}
  def sort([head | _]) when not is_integer(head), do: {:error, :not_integer}

  def sort(arr) do
    do_sort(arr, [])
  end

  defp do_sort([], sorted), do: {:ok, sorted}

  defp do_sort([head | tail], sorted) do
    do_sort(tail, insert(head, sorted))
  end

  defp insert(head, []), do: [head]

  defp insert(x, [y | ys]) do
    if x < y do
      [x, y | ys]
    else
      [y | insert(x, ys)]
    end
  end
end

ExUnit.start()

defmodule TestInsertionSort do
  use ExUnit.Case, async: true

  test "insertion sort 1" do
    assert InsertionSort.sort([7, 12, 9, 11, 3]) === {:ok, [3, 7, 9, 11, 12]}
  end

  test "insertion sort 2" do
    assert InsertionSort.sort([2, 1, 1, 3]) === {:ok, [1, 1, 2, 3]}
  end

  test "empty list" do
    assert InsertionSort.sort([]) === {:ok, []}
  end

  test "length one" do
    assert InsertionSort.sort([1]) === {:ok, [1]}
  end

  test "not a list" do
    assert InsertionSort.sort(123) === {:error, :not_a_list}
  end

  test "not integer" do
    assert InsertionSort.sort(["a", "c"]) === {:error, :not_integer}
  end
end
