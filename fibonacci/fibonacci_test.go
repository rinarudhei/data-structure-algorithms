package fibonacci_test

import (
	"fibonacci"
	"testing"
)

// fib numbers: 1 1 2 3 5 8 13 21 34 55
func TestFib(t *testing.T) {
	tests := []struct {
		name     string
		n        int
		expected int
	}{
		{
			name:     "Fib 5",
			n:        5,
			expected: 5,
		},
		{
			name:     "Fib 10",
			n:        10,
			expected: 55,
		},
		{
			name:     "Fib 1",
			n:        1,
			expected: 1,
		},
		{
			name:     "Fib 2",
			n:        2,
			expected: 1,
		},
		{
			name:     "Fib 3",
			n:        3,
			expected: 2,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			res := fibonacci.Fib(tt.n)

			if res != tt.expected {
				t.Fatalf("actual: %d, expected: %d", res, tt.expected)
			}
		})
	}
}

