package bubble_sort_test

import (
	"bubble_sort"
	"testing"
)

func TestBubbleSort(t *testing.T) {
	tests := []struct {
		name     string
		input    []int
		expected []int
	}{
		{
			name:     "BubbleSort 1",
			input:    []int{7, 12, 9, 11, 3},
			expected: []int{3, 7, 9, 11, 12},
		},
		{
			name:     "BubbleSort 2",
			input:    []int{7, 12},
			expected: []int{7, 12},
		},
		{
			name:     "BubbleSort 3",
			input:    []int{7},
			expected: []int{7},
		},
		{
			name:     "BubbleSort 4",
			input:    []int{},
			expected: []int{},
		},
		{
			name:     "BubbleSort 5",
			input:    []int{1, 2, 3, 4, 5},
			expected: []int{1, 2, 3, 4, 5},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := bubble_sort.BubbleSort(tt.expected)
			for i, el := range result {
				if el != tt.expected[i] {
					t.Fatalf("result: %d, expected: %d", result[i], tt.expected[i])
				}
			}
		})
	}
}
