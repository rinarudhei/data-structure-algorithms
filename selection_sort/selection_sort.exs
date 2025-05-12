defmodule SelectionSort do
  @doc """
    Receive a list, sort the list with SelectionSort algorithm in ascending order.
    Select the minimum value in the list, put it at front of the list.
    Exclude the element from the list, repeat selection.
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

  defp do_sort([]), do: []

  defp do_sort([head | _] = arr) do
    {min_index, min_value} = select_min(arr, 0, 0, head) 
    rest = List.delete_at(arr, min_index)
    [min_value | do_sort(rest)]
  end

  defp select_min([], _, min_index, min_value) do
    {min_index, min_value}
  end

  defp select_min([head | tail], current_index, min_index, min_value) do
    if head < min_value do
      select_min(tail, current_index + 1, current_index, head)
    else
      select_min(tail, current_index + 1, min_index, min_value)
    end
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
