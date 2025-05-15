package insertion_sort

func InsertionSort(arr []int) []int {
    if len(arr) <= 1 {
        return arr
    }
	sorted := make([]int, 0, len(arr))
	sorted = append(sorted, arr[0])
	var res []int
	for i := 1; i < len(arr); i++ {
		res = doInsert(arr[i], sorted)
	}

	return res
}

func doInsert(num int, sorted []int) []int {
	newSorted := make([]int, 0, len(sorted)+1)
	for i := 0; i < len(sorted); i++ {
		currentValue := sorted[i]
		if num >= currentValue {
			newSorted = append(newSorted, currentValue)
		} else {
			newSorted = append(newSorted, []int{num, currentValue}...)
		}
	}

	return newSorted
}


