defmodule QuickSort do
  @doc """
  Accept list of integer.
  Choose the first member of the list as pivot.
  Move lower number to the left and higher number to the right of pivot.
  Do recursion on left and right sublist until their length is less than or equal.
  Merge sub lists with each pivot and return {:ok, sorted_list}.
  Return {:error, :not_list} if input is not a list.
  Return {:error, :not_integer}
  """

  @spec sort(list(integer())) ::
          {:ok, list(integer())} | {:error, :not_list} | {:error, :not_integer}
  def sort([]), do: {:ok, []}
  def sort(arr) when not is_list(arr), do: {:error, :not_list}
  def sort([head | _]) when not is_number(head), do: {:error, :not_integer}

  def sort(arr) do
    {:ok, do_sort(arr, [])}
  end

  defp do_sort([], acc), do: acc

  defp do_sort(arr, acc) do
    pivot = Enum.random(arr)
    rest = List.delete(arr, pivot)
    {left, right} = rest |> Enum.split_with(&(&1 <= pivot))
    acc1 = do_sort(right, acc)
    do_sort(left, [pivot | acc1])
  end
end

ExUnit.start()

defmodule TestQuickSort do
  use ExUnit.Case, async: true

  test "quick sort 1" do
    assert QuickSort.sort([3, 7, 6, -10, 23, 15, 55, -13]) ==
             {:ok, [-13, -10, 3, 6, 7, 15, 23, 55]}
  end

  test "quick sort 2" do
    assert QuickSort.sort([7, 12, 9, 11, 3]) == {:ok, [3, 7, 9, 11, 12]}
  end

  test "quick sort 3" do
    assert QuickSort.sort([10, 7, 8, 9, 1, 5]) == {:ok, [1, 5, 7, 8, 9, 10]}
  end

  test "quick sort 4" do
    assert QuickSort.sort([5, 2, 9, 1, 5, 6]) == {:ok, [1, 2, 5, 5, 6, 9]}
  end

  test "quick sort 5" do
    assert QuickSort.sort([]) == {:ok, []}
    assert QuickSort.sort([1]) == {:ok, [1]}
    assert QuickSort.sort(123) == {:error, :not_list}
  end
end
