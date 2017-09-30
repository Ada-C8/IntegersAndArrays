# require 'pry'
# Returns count of digits matching in the two input non-negative integers
def digit_match(number_1, number_2)
  # puts "NOT IMPLEMENTED"
  # iterate through num, compare last digit of each, then drop
  # final digit and repeat
  count = 0

  while number_1 > 0 && number_2 > 0
    digit1 = number_1 % 10
    digit2 = number_2 % 10

    if digit1 == digit2
      count += 1
    end

    number_1 /= 10
    number_2 /= 10
  end

  return count
end

# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
def is_palindrome(number)
  # puts "NOT IMPLEMENTED"

  # check if only one digit
  if number < 10
    return true
  end

  # binding.pry
  # find first digit
  j = 10
  i = 10
  while number / i > 10
    i *= 10
  end

  while i >= j
    digit1 = (number / i) % 10
    digit2 = (number % j) / (j / 10)

    if digit1 != digit2
      return false
    end

    i /= 10
    j *= 10
  end

  return true
end

# Computes factorial of the input number and returns it
def factorial(number)
  # puts "NOT IMPLEMENTED"
  # base case
  if number == 0
    return 1
  else
    return number * factorial(number - 1)
  end
end

# Computes the nth fibonacci number in the series starting with 0.
# fibonacci series: 0 1 1 2 3 5 8 13 21 ...
# e.g. 0th fibonacci number is 0
# e.g. 1st fibonacci number is 1
# ....
# e.g. 6th fibonacci number is 8
def fibonacci(n)
  # puts "NOT IMPLEMENTED"
  # base case
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return fibonacci(n - 1) + fibonacci(n - 2)
  end
  # return n
end

# with memoization
# def fibonacci(n, memo_hash)
#   # if n in memo_hash, return stored sum
#   # base case; set up initial hash
#   if n == 0
#     memo_hash[0] = 0
#   elsif n == 1
#     memo_hash[1] = 1
#   end
#
#   if memo_hash.include?(n)
#     return memo_hash[n]
#   else
#     fib1 = fibonacci(n - 1, memo_hash)
#     fib2 = fibonacci(n - 2, memo_hash)
#     memo_hash[n] = fib1 + fib2
#
#     return fib1 + fib2
#   end
# end

# Creates a new array to return the intersection of the two input arrays
def intersection(array_1, array_2)
  # puts "NOT IMPLEMENTED"
  intersection = []

  array_1.each do |num1|
    array_2.each do |num2|
      if num1 == num2
        intersection << num1
      end
    end
  end
  return intersection
end

# def merge(array1, array2)
#   i = 0
#   j = 0
#   sorted = []
#
#   while i < array1.length && j < array2.length
#     # iterate through arrays while neither array is empty
#     if array1[i] <= array2[j]
#       sorted << array1[i]
#       i += 1
#     else
#       sorted << array2[j]
#       j += 1
#     end
#   end
#
#   # copy rest of vals in array1, if len array 1 > len array 2
#   (i...array1.length).each do |idx|
#     sorted << array1[idx]
#   end
#
#   # copy rest of vals in array2, if len array2 > len array 1
#   (j...array2.length).each do |idx|
#     sorted << array2[idx]
#   end
#
#   return sorted
# end
#
# def merge_sort(unsorted_array)
#   if unsorted_array.length <= 1
#     return unsorted_array
#   else
#     mid = unsorted_array.length / 2
#     left = unsorted_array[0...mid]
#     right = unsorted_array[mid..-1]
#
#     return merge(merge_sort(left), merge_sort(right))
#   end
#
# end
#
# def intersection(array_1, array_2)
#   intersection = []
#
#   array_1 = merge_sort(array_1)
#   array_2 = merge_sort(array_2)
#
#   len1 = array_1.length
#   len2 = array_2.length
#   i = 0
#   j = 0
#
#   while i < len1 && j < len2
#     if array_1[i] == array_2[j]
#       intersection << array_1[i]
#       i += 1
#       j += 1
#
#     elsif
#       array_1[i] < array_2[j]
#       i += 1
#
#     else
#       j += 1
#     end
#   end
#
#   return intersection
# end

# Questions on 2D array or matrix

# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
def matrix_convert_to_0(matrix)
  # puts "NOT IMPLEMENTED"
  # creates array to store numbers to change
  # avoids issue of turning a number to zero in one row/col and then
  # confusing it w/original input array
  zeros = []

  num_rows = matrix.length
  num_cols = matrix[0].length

  if num_rows == 0 || num_cols == 0
    return
  end

  # iterate through array, get all zeros
  num_rows.times do |row|
    num_cols.times do |col|
      if matrix[row][col] == 0
        zeros << [row, col]
      end
    end
  end

  # iterate through zeros, change relevant rows and cols
  zeros.each do |zero|
    zero_row = zero[0]
    zero_col = zero[1]

    num_cols.times do |col|
      matrix[zero_row][col] = 0
    end

    num_rows.times do |row|
      matrix[row][zero_col] = 0
    end
  end

  return matrix

end

# Checks that for the given matrix. If the sum of each row matches the sum of corresponding 
# column i.e. sum of numbers in row i is the same as the sum of numbers in column i for i = 0 to row.length-1
# If this is the case, return true. Otherwise, return false.
def matrix_check_sum(matrix)
  # puts "NOT IMPLEMENTED"
  num_rows = matrix.length
  num_cols = matrix[0].length

  if num_rows != num_cols
    return false
  end

  row_sums = [0] * num_rows
  col_sums = [0] * num_cols

  num_rows.times do |row|
    num_cols.times do |col|
      row_sums[col] += matrix[row][col]
      col_sums[row] += matrix[row][col]
    end
  end

  num_rows.times do |idx|
    if row_sums[idx] != col_sums[idx]
      return false
    end
  end

  return true
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
# if is_palindrome(1001) == false
#   puts "BUG!! 1001 is a palindrome."
# end
# if is_palindrome(1234321) == false
#   puts "BUG!! 1234321 is a palindrome."
# end
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
          [10, 11, 12]]
if matrix_check_sum(matrix) == true
  puts "BUG!! Sums of each row does NOT match the corresponding column in this matrix."
  rows = matrix.length
  rows.times do |row|
    print matrix[row]
    puts
  end
end
# test 4
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
