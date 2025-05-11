package merge_sort

func MergeSort(arr []int) []int {
	totalLength := len(arr)
	if totalLength <= 1 {
		return arr
	}

	mid := totalLength / 2
	leftArr := arr[0:mid]
	rightArr := arr[mid:]
	sortedLeft := MergeSort(leftArr)
	sortedRight := MergeSort(rightArr)

	sortedArr := mergeSortedArrays(sortedLeft, sortedRight)

	return sortedArr
}

func mergeSortedArrays(leftArr []int, rightArr []int) []int {
	i := 0
	j := 0
	result := make([]int, 0, len(leftArr)+len(rightArr))
	for i < len(leftArr) && j < len(rightArr) {
		if leftArr[i] < rightArr[j] {
			result = append(result, leftArr[i])
			i++
		} else {
			result = append(result, rightArr[j])
			j++
		}
	}

	result = append(result, leftArr[i:]...)
	result = append(result, rightArr[j:]...)

	return result
}
