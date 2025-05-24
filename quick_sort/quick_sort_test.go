package main

import "testing"

func TestQuickShort(t *testing.T) {
	tests := []struct {
		name     string
		input    []int
		expected []int
	}{
		{
			name:     "QuickShort - 1",
			input:    []int{3, 7, 6, -10, 23, 15, 55, -13},
			expected: []int{-13, -10, 3, 6, 7, 15, 23, 55},
		},
		{
			name:     "QuickSort 2",
			input:    []int{7, 12, 9, 11, 3},
			expected: []int{3, 7, 9, 11, 12},
		},
		{
			name:     "QuickSort 3",
			input:    []int{10, 7, 8, 9, 1, 5},
			expected: []int{1, 5, 7, 8, 9, 10},
		},
		{
			name:     "QuickSort 4",
			input:    []int{5, 2, 9, 1, 5, 6},
			expected: []int{1, 2, 5, 5, 6, 9},
		},
		{
			name:     "QuickSort 5",
			input:    []int{7},
			expected: []int{7},
		},
		{
			name:     "QuickSort 6",
			input:    []int{},
			expected: []int{},
		},
		{
			name:     "QuickSort 7",
			input:    []int{1, 2, 3, 4, 5},
			expected: []int{1, 2, 3, 4, 5},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := QuickSort(tt.input)

			for i, el := range result {
				if el != tt.expected[i] {
					t.Fatalf("actual: %v, expected: %v", result, tt.expected)
				}
			}
			t.Log("Test success")
		})
	}
}
