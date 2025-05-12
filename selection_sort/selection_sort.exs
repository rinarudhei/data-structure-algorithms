defmodule SelectionSort do
  @doc """
    Receive a list, sort the list with SelectionSort algorithm in ascending order.
    Return {:ok, result} when success.
    Return {:error, :not_a_list} when input is not a list
    Return {: error, :not_integer} when input element is not integer.
  """
  @spec sort(list(integer())) ::
          {:ok, list(integer())} | {:error, :not_a_list} | {:error, :not_integer}
  def sort(arr) when not is_list(arr), do: {:error, :not_a_list}
  def sort([head | _]) when not is_integer(head), do: {:error, :not_integer}
  def sort([]), do: {:ok, []}
  def sort([_] = arr), do: {:ok, arr}

  def sort(arr) do
    {:ok, do_sort(arr)}
  end

  defp do_sort(arr, sorted \\ [])
  defp do_sort([], sorted), do: sorted

  defp do_sort(arr, sorted) do
    [min_value | rest] = get_min_value(arr)
    do_sort(rest, [min_value | sorted])
  end

  defp get_min_value(arr) do
    min_value = Enum.max(arr)
    rest = List.delete(arr, min_value)
    [min_value | rest]
  end
end

ExUnit.start()

defmodule TestSelectionSort do
  use ExUnit.Case, async: true

  test "selection sort 1" do
    assert SelectionSort.sort([7, 12, 9, 11, 3]) === {:ok, [3, 7, 9, 11, 12]}
  end

  test "selection sort 2" do
    assert SelectionSort.sort([2, 1, 1, 3]) === {:ok, [1, 1, 2, 3]}
  end

  test "empty list" do
    assert SelectionSort.sort([]) === {:ok, []}
  end

  test "length one" do
    assert SelectionSort.sort([1]) === {:ok, [1]}
  end

  test "not a list" do
    assert SelectionSort.sort(123) === {:error, :not_a_list}
  end

  test "not integer" do
    assert SelectionSort.sort(["a", "c"]) === {:error, :not_integer}
  end
end
