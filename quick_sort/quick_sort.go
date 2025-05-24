package main

// Choose pivot element
// Arrange lower number to the left of the pivot
// Arrange higher number to the right of the pivot
func QuickSort(in []int) []int {

	return doSortMemOptimized(in, 0, len(in))
}

func doSortMemOptimized(in []int, lo int, hi int) []int {
	if hi-lo <= 1 {
		return in
	}

	pivotPos := partition(in, lo, hi)

	doSortMemOptimized(in, lo, pivotPos)
	doSortMemOptimized(in, pivotPos+1, hi)

	return in
}

func partition(in []int, lo int, hi int) int {
	i := lo
	pivotPos := hi - 1
	for j := lo; j < hi; j++ {
		if j == pivotPos {
			continue
		}

		if in[j] <= in[pivotPos] {
			in[j], in[i] = in[i], in[j]
			i++
		}
	}

	in[pivotPos], in[i] = in[i], in[pivotPos]

	return i
}

func doSort(in []int) []int {
	var res []int

	if len(in) <= 1 {
		return in
	}
	pivot := in[len(in)-1]
	rest := in[:len(in)-1]

	var left []int
	var right []int
	for _, v := range rest {
		if v <= pivot {
			left = append(left, v)
		} else {
			right = append(right, v)
		}
	}

	res = append(doSort(left), pivot)
	res = append(res, doSort(right)...)
	return res
}
