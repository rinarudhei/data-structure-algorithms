package bubble_sort

func BubbleSort(arr []int) []int {
	if len(arr) < 2 {
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
