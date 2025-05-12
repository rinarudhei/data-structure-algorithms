package selection_sort

import "errors"

// Sort slice using selection sort algorithm.
// Find the smallest integer in the slice,
// Swap the smallest integer to front position.
// Repeat n times, with n is length of slice.
// Return sorted slice and error.
// if slice is empty, return empty slice with error \"empty integer not allowed\"
// if slice length only one, do immediate return with nil error. arr, nil
//
// Examples:
// [7, 9, 3, 4, 5]
// [3, 9, 7, 4, 5]
// [3, 4, 7, 9, 5]
// [3, 4, 5, 9, 7]
// [3, 4, 5, 7, 9] => sorted
func SelectionSort(arr []int) ([]int, error) {
	if len(arr) == 0 {
		return []int{}, errors.New("empty integer not allowed")
	}
	if len(arr) == 1 {
		return arr, nil
	}
	for i := 0; i < len(arr); i++ {
		minValue := arr[i]
		minIndex := i
		for j := i; j < len(arr); j++ {
			if arr[j] < minValue {
				minValue = arr[j]
				minIndex = j
			}
		}

		arr[i], arr[minIndex] = arr[minIndex], arr[i]
	}

	return arr, nil
}
