package fibonacci

// Calculate n-th fibonacci number with memoization.
func Fib(n int) int {
	if n <= 0 {
		return -1
	}
	memo := make(map[int]int)
	res := doFib(n, memo)
	return res
}

func doFib(index int, memo map[int]int) int {
	num, ok := memo[index]
	if ok {
		return num
	}

	if index == 1 || index == 2 {
		memo[index] = 1
		return 1
	}

	doublePrevFib := doFib(index-2, memo)
	prevFib := doFib(index-1, memo)
	memo[index] = doublePrevFib + prevFib
	return doublePrevFib + prevFib
}
