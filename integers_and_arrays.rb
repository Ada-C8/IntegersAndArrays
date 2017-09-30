require 'pry'
# Returns count of digits matching in the two input non-negative integers
def digit_match(number_1, number_2)
  #use modulo to compare last digits
  #use divide to remove the last digits
  #repeat until one of the numbers does not have any more digits
  #use counter to keep track of same digits

  counter = 0

  while number_1 != 0 && number_2 != 0

    last_digit_1 = number_1 % 10
    last_digit_2 = number_2 % 10

    if last_digit_1 == last_digit_2
      counter += 1
    end

    number_1 /= 10
    number_2 /= 10
  end
  return counter
end

#time complexity: O(n), where n in the number of digits in the smaller of the two numbers. We need to check every digit, therefore as the number of digits grows the time it will take to check each one will grow at the same rate.
#space complexity: I believe it's constant, as I am only creating a few local variables (counter, last_digit_1, last_digit_2), and deleting the last digits from the numbers in place.

# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
def is_palindrome(number)
  #find last digit using %
  #find first digit using /
  #compare them
  #if true, delete these digits and continue
  #if false, return false

  while number > 0
    last_digit = number % 10

    first_digit = number #=> new local variable, not new space (I think?)
    counter = 0
    while first_digit >= 10
      first_digit /= 10
      counter += 1
    end

    if first_digit == last_digit
      number /= 10
      number /= (10 * counter - 1)
    else
      return false
    end

  end

  return true
end

#time complexity: O(n), must check every number.
#space complexity: O(1), as only creating a few local variables. I think?

# Computes factorial of the input number and returns it
def factorial(number)
  #number = number * (number - 1 ) * (number - 2)...
  subtract_by = 1
  number_copy = number

  if number == 0
    number += 1
  else
    while subtract_by < number_copy - 1

      number *= (number_copy - subtract_by)
      subtract_by += 1
    end
  end

  return number
end

#time complexity: O(n), where n is how big the number is. As the number gets larger, the number of times through the while loop increases at the same rate.
#space complexity: O(1), as only creating a few local variables.


# Computes the nth fibonacci number in the series starting with 0.
# fibonacci series: 0 1 1 2 3 5 8 13 21 ...
# The next number in the series is the sum of the previous two numbers in the series.
# e.g. 0th fibonacci number is 0
# e.g. 1st fibonacci number is 1
# ....
# e.g. 6th fibonacci number is 8
def fibonacci(n)
  #compute fib numbers until nth number
  #create new array to store numbers
  #create local variables to hold previous two elements
  #create local variable to compute current fib number

  i = 0
  j = i + 1
  n_copy = n
  fib_array =[0, 1]

  if n == 0 || n == 1
    return n
  else
    while i != n_copy - 1
      n = fib_array[i] + fib_array[j]
      fib_array << n
      i += 1
      j = i + 1
    end
  end
  return n
end

#time complexity: n is how big the number is. As n grows, the time it takes to populate the fib_array to find the fib number grows at the same rate O(n).
#space complexity: Creating a new array to store the numbers. As the n grows, the array gets bigger at the same rate O(n) (plus a few local variables)

# Creates a new array to return the intersection of the two input arrays
# The two input arrays have non repeating elements
def intersection(array_1, array_2)
  intersection_array = []
  #compare first number in array_1 with every element in array_2
  #if same number, push that number into intersection_array

  i = 0 #index in array_1
  array_1_length = array_1.length
  array_2_length = array_2.length

  while i < array_1_length  #outer loop
      j = 0 #index in array_2
    while j < array_2_length  #inner loop
      if array_1[i] == array_2[j]
        temp = array_1[i]
        intersection_array << temp
      end
      j += 1
    end
    i += 1
  end

  return intersection_array
end

#time complexity: Outer loop takes 0(n) as array_1 grows, must go through each number. Inner loop also takes O(n), as array_2 grows, must go through each number. Overall time complexity is O(n^2).
#space complexity: Creating a few local variables and a new array, which grows according to how many matches there are. Worst case scenario, all the numbers will match, so it'll take up O(n) space.

# Questions on 2D array or matrix

# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
def matrix_convert_to_0(matrix)
  #search each array to locate all 0
  #store location of 0s in local variables
  #update corresponding columns and rows
    #all arrays at same index will be 0
    #all elements in that array will be 0

  my_zero_locations = [] #store location of 0s

  i = 0
  while i < matrix.length #outer array
    j = 0 #inner array
    while j < matrix[i].length #inner array
      if matrix[i][j] == 0
        my_zero_locations << [i, j]
      end
      j += 1
    end
    i += 1
  end


  if my_zero_locations == []
    return matrix
  else

    i_zeros = 0

    while i_zeros < my_zero_locations.length
      j = 0
      i = 0

      while j < matrix[i].length  #changing all elements in same row in matrix to 0
        matrix[my_zero_locations[i_zeros][0]][j]= 0 #convert all rows with zeros
        j += 1
      end

      while i < matrix.length
        matrix[i][my_zero_locations[i_zeros][1]] = 0 #convert all columns with zeros
        i += 1
      end

      i_zeros += 1

    end
  end

  return matrix
end

#time complexity: To search each array with the array for zeros, it takes 0(n^2) time, as for each array you need to check every number within that array. Then, you need to iterate through, in the worst case, the same size array (On^2), and use these results to change every number in the original array which requires two iterations through, one to change the rows and one to change the columns (On^2) + (On^2). The total time complexity is O(n^2).
#space complexity: Create a new nested array to store the locations of the zeros. In the worst case, if every number was a 0, you'd end up with the same size array O(n).


# Checks that for the given matrix, where number of rows are equal to number of columns
# whether the sum of each row matches the sum of corresponding column i.e. sum
# of numbers in row i is the same as the sum of numbers in column i for i = 0 to row.length-1
# If this is the case, return true. Otherwise, return false.
def matrix_check_sum(matrix)
  #sum row 0 == sum column 0, if yes continue, if no return false

  number_rows_columns = matrix.length

  i = 0
  sum_r = 0 #sum of the row

  sum_c = 0 #sum of the column

  while i < number_rows_columns
    r = i #row
    c = 0 #column
    while c < number_rows_columns
      sum_r += matrix[r][c]
      c += 1
    end

    r = 0
    c = i
    while r < number_rows_columns
      sum_c += matrix[r][c]
      r += 1
    end

    if sum_r == sum_c
    else
      return false
    end

    i += 1
  end

  return true
end

#time complexity: Where n is the length of all the arrays, outer loop O(n), as must go through the full length of the array. Inner loop, for every n, must sum up row and column, O(n) + O(n). Then you compare the sums which takes O(n) time. So would the time complexity be O(n^2)?  
#space complexity: Constant, as are only creating a few new local varibles.

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
