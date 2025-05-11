defmodule MergeSort do
  @doc """
    Receive a list and return a sorted list. 
    Divide the list into left and right,
    then merge softed left and right list.
  """
  @spec sort(list()) :: list()
  def sort([_head] = arr), do: arr

  def sort(arr) do
    {left_list, right_list} = Enum.split(arr, div(length(arr), 2))
    merge(sort(left_list), sort(right_list))
  end

  defp merge(left_list, right_list, acc \\ [])
  defp merge([], [], acc), do: Enum.reverse(acc)

  defp merge([], [head | tail], acc) do
    merge([], tail, [head | acc])
  end

  defp merge([head | tail], [], acc) do
    merge(tail, [], [head | acc])
  end

  defp merge([l_head | l_tail], [r_head | r_tail], acc) do
    cond do
      l_head <= r_head ->
        merge(l_tail, [r_head | r_tail], [l_head | acc])

      true ->
        merge([l_head | l_tail], r_tail, [r_head | acc])
    end
  end
end

ExUnit.start()

defmodule MergeSortTest do
  use ExUnit.Case, async: true

  test "MergeSort" do
    assert MergeSort.sort([3, 7, 6, -10, 23, 15, 55, -13]) == [-13, -10, 3, 6, 7, 15, 23, 55]
  end
end
