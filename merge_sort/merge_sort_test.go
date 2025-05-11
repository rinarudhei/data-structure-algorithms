package merge_sort_test

import (
	"merge_sort"
	"testing"
)

func TestMergeShort(t *testing.T) {
	tests := []struct {
		name     string
		input    []int
		expected []int
	}{
		{
			name:     "MergeShort - 1",
			input:    []int{3, 7, 6, -10, 23, 15, 55, -13},
			expected: []int{-13, -10, 3, 6, 7, 15, 23, 55},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := merge_sort.MergeSort(tt.input)

			for i, el := range result {
				if el != tt.expected[i] {
					t.Fatalf("left: %d, right: %d", el, tt.expected[i])
				}
			}
			t.Log("Test success")
		})
	}
}
