# Returns count of digits matching in the two input non-negative integers
# Time Complexity: O(n), where n is number of digits in shorter input
# Space Complexity: O(1)
def digit_match(number_1, number_2)
  counter = 0
  while number_1 > 0 && number_2 > 0
    if number_1 % 10 == number_2 % 10
      counter += 1
    end
    number_1 /= 10
    number_2 /= 10
  end
  return counter
end

# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
# Time Complexity: O(n), where n is number of digits in input
# Space Complexity: O(1)
def is_palindrome(number)
  if (number % 10 == 0)
    return false
  end
  lastdigit = 0
  first_half = number
  reverse_of_second_half = 0
  while (first_half > reverse_of_second_half) do
    lastdigit = first_half % 10
    # add last digit to the start of reverse_of_second_half
    reverse_of_second_half = reverse_of_second_half * 10 + lastdigit
    # remove last digit
    first_half /= 10
  end

  if first_half == reverse_of_second_half
    return true
  end
  first_half = first_half * 10 + lastdigit # for odd number
  if first_half == reverse_of_second_half
    return true
  else
    return false
  end
end

# Computes factorial of the input number and returns it
# Time Complexity: O(n)
# Space Complexity: O(n), because of stack memory used by recursive calls
def factorial(number)
  if number <= 1
    return 1
  else
    number * factorial(number - 1)
  end
end

# To reduce Space Complexity we can use non recursive version
# Time Complexity: O(n)
# Space Complexity: O(1)
def factorial_modified(number)
  if number <= 1
    return 1
  else
    i = 1
    result = 1
    while i < number do
      result *= (i + 1)
      i += 1
    end
    return result
  end
end


# Computes the nth fibonacci number in the series starting with 0.
# fibonacci series: 0 1 1 2 3 5 8 13 21 ...
# e.g. 0th fibonacci number is 0
# e.g. 1st fibonacci number is 1
# ....
# e.g. 6th fibonacci number is 8

# Time Complexity: O(n)= O(n-1) + O(n-2)
# Space Complexity: O(n) because of the recursive calls
def fibonacci(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end


def modified_fibonacci(n) # Fibonacci without using recursion
  a = 0                   # Time Complexity: O(n), Space Complexity: O(1)
  b = 1
  for i in 0..n
    a, b = b, a + b
  end
  return a
end

# def modified_fibonacci(n)
#   a = 0                   # Time Complexity: O(n), Space Complexity: O(1)
#   b = 1
#   if n == 0
#     return a
#   elsif n == 1
#     return b
#   else
#     for i in 2..n
#       c = a + b
#       a = b
#       b = c
#     end
#     return b
#   end
# end

# Creates a new array to return the intersection of the two input arrays
# Time Complexity: O(m*n) for each element in array_1, we need to iterate through array_2
# Space Complexity: O(n) Created a new array to store numbers that are intersections
def intersection(array_1, array_2)
  if array_1 != [] && array_2 != []
    intersects = []
    i = 0
    while i < array_1.length
      j = 0
      while j < array_2.length
        if array_1[i] == array_2[j]
          intersects << array_1[i]
        end
        j += 1
      end
      i += 1
    end
    return intersects
  else
    return []
  end
end


# Questions on 2D array or matrix

# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
# Time Complexity : O(n * m) I iterated through 2 arrays in helper methods, through 2 arrays with zeros,
# and 2 times on row and column. So,
# O(n) + O (n) + O(n) * O(m) + O(n) + O(n) = O(n*m) + O(n+n+n+n) = O(n*m)
# Space Complexity: O(n + m) I created two arrays, one for rows with zeros, one for columns with zeros

# Helper method to convert given column to zeros
def zero_column(matrix, col)
  matrix.length.times do |row|
    matrix[row][col] = 0
  end
end
# Helper method to convert given row in a matrix to zeros
def zero_row(matrix, row)
  matrix[row].length.times do |col|
    matrix[row][col] = 0
  end
end
def matrix_convert_to_0(matrix)
  row_with_zeros = []
  column_with_zeros = []
  matrix.length.times do |i|
    matrix[0].length.times do |j|
      if matrix[i][j] == 0
        if !row_with_zeros.include?(i)
          row_with_zeros << i
        end
        if !column_with_zeros.include?(j)
          column_with_zeros << j
        end
      end
    end
  end

 for a in row_with_zeros do
  zero_row(matrix, a)
 end

 for b in column_with_zeros do
  zero_column(matrix, b)
 end

end

# Checks that for the given matrix, where number of rows are equal to number of columns
# whether the sum of each row matches the sum of corresponding column i.e. sum
# of numbers in row i is the same as the sum of numbers in column i for i = 0 to row.length-1
# If this is the case, return true. Otherwise, return false.
# Time Complexity: O(n * m) For each column iterates through the length of an array once
# Space Complexity: O(1) Used 2 constant variables.

def matrix_check_sum(matrix)
  rows = matrix.length
  columns = matrix[0].length
  if rows != columns
    return false
  else
    sum_rows = 0
    sum_columns = 0
    rows.times do |i|
      matrix[i].length.times do |j|
        sum_rows += matrix[i][j]
        sum_columns += matrix[j][i]
      end
    end
    if sum_rows == sum_columns
      return true
    else
      return false
    end
  end
end

### END OF METHODS
puts "Tests for Digit Match"
count = digit_match(1072503891, 62530841)
if count != 4
  puts "BUG!! 4 digits should match for (1072503891, 62530841). Returned value: #{count}"
end
count = digit_match(1234, 4321)
if count != 0
  puts "BUG!! No digits should match for (1234, 4321). Returned value: #{count}"
end
count = digit_match(3862947593, 3862947593)
if count != 10
  puts "BUG!! 10 digits should match for (3862947593, 3862947593). Returned value: #{count}"
end
puts "End of digit match tests.\n\n"

puts "Tests for Palindrome"
if is_palindrome(1001) == false
  puts "BUG!! 1001 is a palindrome."
end
if is_palindrome(1234321) == false
  puts "BUG!! 1234321 is a palindrome."
end
if is_palindrome(77) == false
  puts "BUG!! 77 is a palindrome."
end
if is_palindrome(12345) == true
  puts "BUG!! 12345 is NOT a palindrome."
end
if is_palindrome(123421) == true
  puts "BUG!! 123421 is NOT a palindrome."
end
if is_palindrome(15677641) == true
  puts "BUG!! 15677641 is NOT a palindrome."
end
puts "End of Palindrome tests.\n\n"

puts "Tests for Factorial"
fact = factorial(5)
if fact != 120
  puts "BUG!! Factorial of 5 should be 120 and not #{fact}."
end
fact = factorial(1)
if fact != 1
  puts "BUG!! Factorial of 1 should be 1 and not #{fact}."
end
fact = factorial(0)
if fact != 1
  puts "BUG!! Factorial of 0 should be 1 and not #{fact}."
end
fact = factorial(6)
if fact != 720
  puts "BUG!! Factorial of 6 should be 720 and not #{fact}."
end
fact = factorial(7)
if fact != 5040
  puts "BUG!! Factorial of 7 should be 5040 and not #{fact}."
end
puts "End of Factorial tests.\n\n"

puts "Tests for nth fibonacci number."
# 0 1 1 2 3 5 8 13 21 34 55 89 144
fib = fibonacci(1)
if fib != 1
  puts "BUG!! the 1st fibonacci number is 1 and not #{fib}."
end
fib = fibonacci(3)
if fib != 2
  puts "BUG!! the 3rd fibonacci number is 2 and not #{fib}."
end
fib = fibonacci(8)
if fib != 21
  puts "BUG!! the 8th fibonacci number is 21 and not #{fib}."
end
fib = fibonacci(11)
if fib != 89
  puts "BUG!! the 11th fibonacci number is 89 and not #{fib}."
end
fib = fibonacci(12)
if fib != 144
  puts "BUG!! the 12th fibonacci number is 144 and not #{fib}."
end
fib = fibonacci(6)
if fib != 8
  puts "BUG!! the 6th fibonacci number is 8 and not #{fib}."
end
puts "End of Fibonacci tests.\n\n"

puts "Tests for intersection of two arrays."
# Test 1
array_1 = [70, 90, 34, 21, 78, 42]
array_2 = []
expected_intersection = []
common_elements = intersection(array_1, array_2)
if common_elements != expected_intersection
  puts "BUG!! Intersection elements unexpected."
  print "Array 1: "
  print array_1
  print " Array 2: "
  print array_2
  puts
  print "Expected intersection: "
  print expected_intersection
  print "Intersection method returned: "
  print common_elements
  puts
end
# Test 2
array_1 = [70, 90, 34, 21, 78, 42]
array_2 = [21, 67, 54, 29, 42, 30]
expected_intersection = [21, 42]
common_elements = intersection(array_1, array_2).sort
if common_elements != expected_intersection
  puts "BUG!! Intersection elements unexpected."
  print "Array 1: "
  print array_1
  print " Array 2: "
  print array_2
  puts
  print "Expected intersection: "
  print expected_intersection
  print "Intersection method returned: "
  print common_elements
  puts
end
# Test 3
array_1 = [2, 5, 4, 1, 89]
array_2 = [89, 5, 4, 1, 2]
expected_intersection = [1, 2, 4, 5, 89]
common_elements = intersection(array_1, array_2).sort
if common_elements != expected_intersection
  puts "BUG!! Intersection elements unexpected."
  print "Array 1: "
  print array_1
  print " Array 2: "
  print array_2
  puts
  print "Expected intersection: "
  print expected_intersection
  print "Intersection method returned: "
  print common_elements
  puts
end
# Test 4
array_1 = [92, 2, 5, 4, 1, 89, 90]
array_2 = [89, 5, 76, 4, 1, 2]
expected_intersection = [1, 2, 4, 5, 89]
common_elements = intersection(array_1, array_2).sort
if common_elements != expected_intersection
  puts "BUG!! Intersection elements unexpected."
  print "Array 1: "
  print array_1
  print " Array 2: "
  print array_2
  puts
  print "Expected intersection: "
  print expected_intersection
  print "Intersection method returned: "
  print common_elements
  puts
end
puts "End of intersection of two arrays tests.\n\n"

puts "Tests for Matrix convert to zero"
## helper method for creating and initializing a matrix with 1s
def initialize_matrix(rows, columns)
  # create the matrix using the rows and columns
  matrix = Array.new(rows){Array.new(columns)}

  # initialize the matrix
  rows.times do |row|
    columns.times do |column|
      matrix[row][column] = 1
    end
  end
  return matrix
end
# helper method for verifying updated matrix
def verify_matrix(matrix, rows_array, columns_array)
  rows = matrix.size
  columns = matrix[0].size

  rows.times do |row|
    columns.times do |column|
      if (rows_array.include?(row) || columns_array.include?(column))
        if matrix[row][column] != 0
          puts "BUG!!! matrix[#{row}][#{column}] should be 0"
          return false
        end
      elsif matrix[row][column] != 1
        puts "BUG!!! matrix[#{row}][#{column}] should be 1"
        return false
      end
    end
  end
  return true
end

def print_matrix(matrix)
  matrix.size.times do |row|
    print matrix[row]
    puts
  end
end

# Test 1
rows = 3
columns = 5
matrix = initialize_matrix(rows, columns)
matrix[1][3] = 0 # row 1, column 3
matrix[2][4] = 0 # row 2, column 4
rows_array = [1, 2]
columns_array = [3, 4]
puts "Original:"
rows.times do |row|
  print matrix[row]
  puts
end
matrix_convert_to_0(matrix)
puts "Converted:"
rows.times do |row|
  print matrix[row]
  puts
end
verify_matrix(matrix, rows_array, columns_array)
# Test 2
rows = 5
columns = 3
matrix = initialize_matrix(rows, columns)
matrix[0][1] = 0 # row 0, column 1
matrix[1][1] = 0 # row 1, column 1
matrix[2][1] = 0 # row 2, column 1
matrix[3][1] = 0 # row 3, column 1
matrix[4][1] = 0 # row 4, column 1
rows_array = [0, 1, 2, 3, 4]
columns_array = [1]
puts "Original:"
rows.times do |row|
  print matrix[row]
  puts
end
matrix_convert_to_0(matrix)
puts "Converted:"
rows.times do |row|
  print matrix[row]
  puts
end
verify_matrix(matrix, rows_array, columns_array)
# Test 3
rows = 4
columns = 4
matrix = initialize_matrix(rows, columns)
rows_array = []
columns_array = []
puts "Original:"
rows.times do |row|
  print matrix[row]
  puts
end
matrix_convert_to_0(matrix)
puts "Converted:"
rows.times do |row|
  print matrix[row]
  puts
end
verify_matrix(matrix, rows_array, columns_array)
puts "End of matrix convert to zero tests.\n\n"

puts "Tests for Matrix check sum of rows and columns"
matrix = [[1, 2, 3, 4], # sum of 0th row = 10
          [9, 5, 3, 1], # sum of 1st row = 18
          [0, 3, 5, 6], # sum of 2nd row = 14
          [0, 8, 3, 6]] # sum of 3rd row = 17
# sums = 10, 18, 14, 17 for columns 0 through 3
if matrix_check_sum(matrix) == false
  puts "BUG!! Sums of each row matches the corresponding column in this matrix."
  rows = matrix.length
  rows.times do |row|
    print matrix[row]
    puts
  end
end
# test 2
rows = 5
columns = 5
matrix = initialize_matrix(rows, columns) # initialize to all 0s
matrix[0][2] = 4
matrix[2][0] = 4
if matrix_check_sum(matrix) == false
  puts "BUG!! Sums of each row matches the corresponding column in this matrix."
  rows = matrix.length
  rows.times do |row|
    print matrix[row]
    puts
  end
end
# test 3
matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [10, 11, 12]]
if matrix_check_sum(matrix) == true
  puts "BUG!! Sums of each row does NOT match the corresponding column in this matrix."
  rows = matrix.length
  rows.times do |row|
    print matrix[row]
    puts
  end
end
# test 3
matrix = [[1, 10, 1],
          [2, 3, 12],
          [9, 4, 9]]
if matrix_check_sum(matrix) == false
  puts "BUG!! Sums of each row matches the corresponding column in this matrix."
  rows = matrix.length
  rows.times do |row|
    print matrix[row]
    puts
  end
end
puts "End of matrix check sum of rows and columns.\n\n"
