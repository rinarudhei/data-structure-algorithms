defmodule BubbleSort do
  @doc """
    Receive a list of integer, sort the list with bubble sort algorithm.
    Return {:ok, result} when success,
    return {:error, :not_a_list} when input is not a list, 
    return {:error, :not_integer} when input element is not an integer.
  """
  @spec sort(list(integer()), boolean()) ::
          {:ok, list(integer())} | {:error, :not_a_list} | {:error, :not_integer}
  def sort(arr, is_sorted? \\ false)
  def sort([_] = arr, _), do: {:ok, arr}
  def sort([], _), do: {:ok, []}
  def sort(arr, _) when not is_list(arr), do: {:error, :not_a_list}
  def sort([head | _], _) when not is_integer(head), do: {:error, :not_integer}

  def sort(arr, false) do
    case do_sort(arr, true) do
      {sorted_arr, true} -> {:ok, sorted_arr}
      {partially_sorted_arr, false} -> sort(partially_sorted_arr, false)
    end
  end

  defp do_sort([_] = arr, is_sorted?), do: {arr, is_sorted?}

  defp do_sort([first, second | tail], is_sorted?) do
    if first < second do
      {sorted_rest, rest_sorted?} = do_sort([second | tail], is_sorted?)
      {[first | sorted_rest], rest_sorted?}
    else
      {sorted_rest, _} = do_sort([first | tail], false)
      {[second | sorted_rest], false}
    end
  end
end

ExUnit.start()

defmodule TestBubbleSort do
  use ExUnit.Case, async: true

  test "bubble sort 1" do
    assert BubbleSort.sort([1]) === {:ok, [1]}
  end

  test "bubble sort 2" do
    assert BubbleSort.sort({:input, true}) === {:error, :not_a_list}
  end

  test "bubble sort 3" do
    assert BubbleSort.sort([%{}, %{}]) === {:error, :not_integer}
  end

  test "bubble sort 4" do
    assert BubbleSort.sort([7, 12, 9, 11, 3]) === {:ok, [3, 7, 9, 11, 12]}
  end
end
