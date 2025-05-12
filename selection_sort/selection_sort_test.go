package selection_sort_test

import (
	"selection_sort"
	"testing"
)

func TestSelectionSort(t *testing.T) {
	tests := []struct {
		name     string
		input    []int
		expected []int
		wantErr  bool
	}{
		{
			name:     "selection sort 1",
			input:    []int{7, 12, 9, 11, 3},
			expected: []int{3, 7, 9, 11, 12},
			wantErr:  false,
		},
		{
			name:     "error when slice is empty",
			input:    []int{},
			expected: []int{},
			wantErr:  true,
		},
		{
			name:     "handle slice with len one",
			input:    []int{1},
			expected: []int{1},
			wantErr:  false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			res, err := selection_sort.SelectionSort(tt.input)
			if tt.wantErr && err == nil {
				t.Fatalf("expect error instead of nil")
			} else {
				for i, el := range res {
					if el != tt.expected[i] {
						t.Fatalf("actual: %d, expected: %d", el, tt.expected[i])
					}
				}

			}
		})
	}
}
