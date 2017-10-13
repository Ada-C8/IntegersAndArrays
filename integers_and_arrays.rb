# Returns count of digits matching in the two input non-negative integers
# Time complexity: O(k) where k is the number of digits in the number containing less digits
# Aside: The number of digits (i.e. k) in a decimal number n is roughly "log (base 10) of (n * 10)"
#        So the time complexity could be said to be O(lg (n*10)) with lg being log to the base 10.
# Space complexity: O(1) - auxiliary storage does not change based on input
def digit_match(number_1, number_2)
  return 0 if number_1 < 0 || number_2 < 0 # ensure non-negative integers
  count = 0
  while number_1 > 0 && number_2 > 0
    # get the last digit of each number
    last_digit_number_1 = number_1 % 10
    last_digit_number_2 = number_2 % 10
    # compare the last digit of each number
    if last_digit_number_1 == last_digit_number_2
      count += 1
    end
    # remove the last digit of number_1 and number_2
    number_1 = number_1 / 10
    number_2 = number_2 / 10
  end
  return count
end

# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
# The approach below compares one digit at a time.
# Time complexity: O(k) where k is the number of digits in the number,
#                  or O(lg (number*10)), where lg is log to the base 10
# Space complexity: O(1) since the auxiliary storage used does not change based on input
# An alternative approach, is to reverse the number and save it separately and
# compare it with the input. If they are equal, then the number is a palindrome.
# The alternative approach uses O(k) space.
def is_palindrome(number)
  return false if number < 0

  # figure out the number of 0s in divisor
  div = 1
  while (number / div) >= 10
    div *= 10
  end

  while number > 0
    left = number / div # get the left most digit
    right = number % 10 # get the right most digit
    if left != right # compare the leftmost digit with the right most digit
      return false
    end

    number = (number % div) # remove one digit from the left
    number = number / 10 # remove one digit from the right
    div /= 100 # remove two digits from the divisor to compensate for left and right digits
  end
  return true
end

# Computes factorial of the input number and returns it
# Time complexity: O(number) becomes the loop will get executed 'number' number of times
# Space complexity: O(1) - fact auxiliary variable used
def factorial(number)
  fact = 1
  while number > 1
    fact = fact * number
    number -= 1
  end
  return fact
end

# Computes the nth fibonacci number in the series starting with 0.
# fibonacci series: 0 1 1 2 3 5 8 13 21 ...
# e.g. 0th fibonacci number is 0
# e.g. 1st fibonacci number is 1
# ....
# e.g. 6th fibonacci number is 8
# Time complexity: O(n) - that's the number of times the loop will get executed
# Space complexity: O(1) - first, second and current use constant space as input value changes
def fibonacci(n)
  if n == 0 || n == 1
    return n
  end
  first = 0
  second = 1
  current = 1
  while n > 2
    first = second
    second = current
    current = first + second
    n -= 1
  end
  return current
end

# Creates a new array to return the intersection of the two input arrays
# Brute force approach
# Time complexity: O(m*n) where array_1 has m elements and array_2 has n elements
# Space complexity: O(n) if n < m since common_elements array gets created and
#                   returned and at the most all elements will match.
def intersection(array_1, array_2)
  common_elements = []
  array_1.each do |number_1|
    array_2.each do |number_2|
      if number_1 == number_2
        common_elements << number_1
        break
      end
    end
  end
  return common_elements
end

# needed for the sorting approach below to find intersection
# def binary_search(array, value_to_find)
#   return false if array.length == 0
#   low = 0
#   high = array.length-1
#   while low < high
#     mid = (high+low)/2
#     if array[mid] == value_to_find
#       return true
#     elsif array[mid] > value_to_find
#       high = mid-1
#     elsif array[mid] < value_to_find
#       low = mid+1
#     end
#   end
#
#   return true if array[low] == value_to_find
# end
#
# # Leveraging sorting approach
# def intersection(array_1, array_2)
#   if array_1.length < array_2.length
#     array_2.sort! # O(m log m) time
#     larger = array_2
#     smaller = array_1
#   else
#     array_1.sort! # O(m log m) time
#     larger = array_1
#     smaller = array_2
#   end
#   common_elements = []
#   smaller.each do |number_1|
#     # runs n times
#     if binary_search(larger, number_1)
#       # takes log m time
#       common_elements << number_1
#     end
#   end # overall: O(n log m)
# end

# # Leveraging sorting approach
# def intersection(array_1, array_2)
#   if array_1.length < array_2.length
#     larger = array_2
#     smaller = array_1
#   else
#     larger = array_1
#     smaller = array_2
#   end
#   my_hash = Hash.new()
#   smaller.each do |num|
#     my_hash[num] = 1
#   end # O(n) space and O(n) time
#   common_elements = []
#   larger.each do |num_1|
#     # runs m times
#     if my_hash.include? num_1
#       # takes O(1) time
#       common_elements << num_1
#     end
#   end
#   # overall: O(n+m) time
#   # overall: O(n) space
#   return common_elements
# end


# Questions on 2D array or matrix

# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
# Time complexity: O(rows * columns) - the number of times the nested loop statements get executed
# Space complexity: O(1) - rows and columns are auxiliary variables that won't change as matrix size changes
def matrix_convert_to_0(matrix)
  rows = matrix.length
  columns = matrix[0].length
  # if any column in the row is 0, make the first column 0
  # if any row in the column is 0, make the first row 0
  # by using the first row and first column in the matrix, save on additional space usage
  rows.times do |row|
    columns.times do |column|
      if matrix[row][column] == 0
        matrix[0][column] = 0
        matrix[row][0] = 0
      end
    end
  end

  # if the corresponding 0th row, or 0th column has value of 0, make it 0
  rows.times do |row|
    columns.times do |column|
      if matrix[0][column] == 0 || matrix[row][0] == 0
        matrix[row][column] = 0
      end
    end
  end
end

# Checks that for the given matrix, where number of rows are equal to number of columns
# whether the sum of each row matches the sum of corresponding column i.e. sum
# of numbers in row i is the same as the sum of numbers in column i for i = 0 to row.length-1
# If this is the case, return true. Otherwise, return false.
# Time complexity: O(rows * columns) - the number of times the nested loop statements get executed
# Space complexity: O(1) rows and columns are auxiliary variables that won't change as matrix size changes
def matrix_check_sum(matrix)
  rows = matrix.length
  columns = matrix[0].length
  return false if rows != columns

  rows.times do |i|
    sum_rows = 0
    sum_columns = 0
    columns.times do |j|
      sum_rows += matrix[i][j]
      sum_columns += matrix[j][i]
    end
    if sum_rows != sum_columns
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
  puts "BUG!! the 1st fibonacci number is 0 and not #{fib}."
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
  # deduce the rows and columns in the matrix
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
