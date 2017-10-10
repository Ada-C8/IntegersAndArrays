# Returns count of digits matching in the two input non-negative integers
def digit_match(number_1, number_2)
  matches = 0
  while number_1 > 0 && number_2 > 0
    digit_1 = number_1 % 10
    digit_2 = number_2 % 10
    number_1 /= 10
    number_2 /= 10
    if digit_1 == digit_2
      matches += 1
    end
  end
  # puts "NOT IMPLEMENTED"
  return matches
end

# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
def is_palindrome(number)
  num_str = number.to_s
  front_index = 0
  back_index = num_str.length-1
  while front_index < back_index
    if num_str[front_index] != num_str[back_index]
      return false
    end
    front_index += 1
    back_index -= 1
  end
  # puts "NOT IMPLEMENTED"
  return true
end

# Computes factorial of the input number and returns it
def factorial(number)
  num = 1
  while number > 1
    num *= number
    number -= 1
  end
  # puts "NOT IMPLEMENTED"
  return num
end

# Computes the nth fibonacci number in the series starting with 0.
# fibonacci series: 0 1 1 2 3 5 8 13 21 ...
# e.g. 0th fibonacci number is 0
# e.g. 1st fibonacci number is 1
# ....
# e.g. 6th fibonacci number is 8
def fibonacci(n)
  if n == 0
    return 0
  end
  fibonacci_index = 1
  current = 1
  past = 0
  while n > fibonacci_index
    next_fib = current + past
    past = current
    current = next_fib
    fibonacci_index += 1
    # puts "NOT IMPLEMENTED"
  end
  return current
end

# Creates a new array to return the intersection of the two input arrays
def intersection(array_1, array_2)
  index = 0
  intersection = []
  while index < array_1.length
    if array_2.include?(array_1[index])
      intersection << array_1[index]
    end
    index += 1
  end
  # puts "NOT IMPLEMENTED"
  return intersection
end

# Questions on 2D array or matrix

# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
def matrix_convert_to_0(matrix)
  # [[row].length, [column].length]
  width = matrix.length
  height = matrix[0].length
  zeros = []
  x = 0
  while x < width
    y = 0
    while y < height
      if matrix[x][y] == 0
        zeros << [x, y]
      end
      y += 1
    end
    x += 1
  end
  
  zeros.each do |bomb|
    x = bomb[0]
    y = bomb[1]
    x_index = 0
    while x_index < width
      matrix[x_index][y] = 0
      x_index += 1
    end
    y_index = 0
    while y_index < height
      matrix[x][y_index] = 0
      y_index += 1
    end
  end
  # puts "NOT IMPLEMENTED"
end

# Checks that for the given matrix. If the sum of each row matches the sum of corresponding
# column i.e. sum of numbers in row i is the same as the sum of numbers in column i for i = 0 to row.length-1
# If this is the case, return true. Otherwise, return false.
def matrix_check_sum(matrix)
  size = matrix.length
  i = 0

  while i < size
    # Find the sum of the row
    x = 0
    row_sum = 0
    while x < size
      row_sum += matrix[x][i]
      x += 1
    end
    # Find the sum of the column
    y = 0
    col_sum = 0
    while y < size
      col_sum += matrix[i][y]
      y += 1
    end

    if row_sum != col_sum
      return false
    end
    # Compare if they match
    i += 1
  end
  return true
  # puts "NOT IMPLEMENTED"
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
