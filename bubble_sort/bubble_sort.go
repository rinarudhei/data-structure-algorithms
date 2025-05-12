package bubble_sort

// Sort slice input with BubbleSort algorithms.
// Iterate slice element,
// compare current element with next element,
// swap elements to sort.
// Repeat until no swap happened, return the sorted slice.
// Return slice input immediatly if array length is less than or equal one. 
// [7, 9, 11, 5, 4]
// [7, 9, 11, 4, 5]
// [7, 9, 4, 5, 11]
// [7, 4, 5, 9, 11]
// [4, 5, 7, 9, 11]
func BubbleSort(arr []int) []int {
	if len(arr) <= 1 {
		return arr
	}
	isSorted := false
	for !isSorted {
		isSorted = true
		for i := 0; i < len(arr)-1; i++ {
			if arr[i] > arr[i+1] {
				temp := arr[i]
				arr[i] = arr[i+1]
				arr[i+1] = temp
				isSorted = false
			}
		}
	}

	return arr
}
