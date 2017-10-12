require 'pry'
# Returns count of digits matching in the two input non-negative integers
# TC - O(n) - the method looks through each digit in the string and terminate when the shortest string = 0 or runs out of digits. Worst case the string would be the same size so O(n) is dependent on the lenght of n.
# SC - O(1) - the number of variables is constant no matter the size of the strings passed into the method.
def digit_match(number_1, number_2)
  match_counter = 0
  #until we run out of digits
  until number_1 == 0 || number_2 == 0
    # if last digits are equal add one to match_counter
    if number_1 % 10 == number_2 % 10
      match_counter += 1
    end
    # remove last digit from number
    number_1 /= 10
    number_2 /= 10
  end
  return counter
end

# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
# http://www.sanfoundry.com/python-program-check-number-palindrome/
# TC - O(n) - the while loop run once for each digit in the number meaning time complexity is linear
# SC - O(1) - the number of variables is constant, regardless of the size of the number passed into the method.
def is_palindrome(number)
  # temp store number in a variable
  n = number
  reversed_number = 0

  while n > 0
    #pulls off last digit of the number and store in last_digit varaible
    last_digit = n % 10
    # add a zero (digit / sigfig) to reversed_number with * 10 then adds last_digit (ex rev = 10 * 10 => 100 + last_digit)
    reversed_number = reversed_number * 10 + last_digit
    # removes last digit from number
    n /= 10
  end
  number == reversed_number ? (return true) : (return false)
end

# Computes factorial of the input number and returns it
# https://codereview.stackexchange.com/questions/82394/different-factorial-algorithms
# TC - O(n) - each count of the while loop will decrement the number by 1 and will terminate when n = 0, meaning the last run will be n = 1. Meaning it runs n-1 times making O(n-1), the constant drops making it O(n).
# SC - O(1) - the number of variables is constant regardless of the size of the number passed into the method.
def factorial(number)
  total = 1
  while number > 1
    total *= number
    number -= 1 # decrement number
  end
  return total
end

# Computes the nth fibonacci number in the series starting with 0.
# fibonacci series: 0 1 1 2 3 5 8 13 21 ...
# e.g. 0th fibonacci number is 0
# e.g. 1st fibonacci number is 1
# ....
# e.g. 6th fibonacci number is 8
# https://stackoverflow.com/questions/24438655/ruby-fibonacci-algorithm
#
# TC - O(n) - The method has a loop that runs n times where n is the number passed into the method, which would be a linear time complexity.
# SC - O(1) - space complexity is constant, it doesn't change as the size of the n passed into the method changes.
def fibonacci(n)
  if n == 0
    return n
  else
    new_num = 1
    old_num = 0
    n.times do
      temp = old_num
      old_num = new_num
      new_num = new_num + temp
    end
    return old_num
  end
end

# Creates a new array to return the intersection of the two input arrays
# TC - O(n^2) quadratic - This method has two loops that are nested, each looping through the lenght of the arrays which would be a quadratic time complexity.
# SC - O(n) - This method has a holder array which increases in size based on the number of matches. Worst case scenario the two arrays passed into the method are identical and every element at each index is a match meaning the the size of the holder array is identical to the lenght of the arrays.
def intersection(array_1, array_2)
  holder = []
  if array_1.length == 0 || array_2.length == 0
    return holder
  end
  # index for array 1
  i = 0
  while i < array_1.length
    # index for array 2
    j = 0
    while j < array_2.length
      if array_1[i] == array_2[j]
        temp = array_1[i]
        holder << temp
      end
      j += 1
    end
    i += 1
  end
  return holder
end

# Questions on 2D array or matrix

# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
# TC - To search each point in the matrix means going through nested loops based on the number of rows and columns in the matrix which would take O(n^2) time. After going through this you have to loop back through the matrix again and change stuff from ones to zeros based on the number of zeros (lenght of coordinates), worst case everything is a zero, and then we have to loop through it all again which would be O(n^2) agains. O(n^2 + n^2). I'm not confident on this. Does the second n^2 drop?
# SC - O(n) - worst case everything is a zero meaning your coordinates array variable is the same as the martix passed into the method.
def matrix_convert_to_0(matrix)
  coordinates = [] # martrix to store coordinates of zeros [row,column]

  i = 0
  # accesses the rows, outer array
  while i < matrix.length # less than the number of rows in matrix, length = 4 and with array we will get 0..3 rows and end at 4
    j = 0
    #accesses the columns, inner array
    while j < matrix[i].length # less than the columns in array, length = 3 and we just need 0..2 columns
      if matrix[i][j] == 0
        coordinates << [i,j] #[row,column] of 0 location
      end
      j += 1 # increment columns counter
    end
    i += 1 #increment rows counter
  end
  # at this point we have gone through whole matrix and have coordinates of zeros now we need to change stuff!

  if coordinates == []
    return matrix # return if no zeros
  else
    zero = 0 # coordinates counter
    while zero < coordinates.length # rows length
      j = 0 # columns counter
      k = 0 # rows counter
      # change all rows to zero
      while j < matrix[k].length # column length 3, ends after 2
        matrix[coordinates[zero][0]][j] = 0 # for each coordinate will look at row (holding 0 constant), and for each column (j) will change to zero
        j += 1 # increment column counter
      end

      #change all of the columns to zero
      while k < matrix.length # row length 4, ends after 3
        matrix[k][coordinates[zero][1]] = 0 # for each coordinate it will focus on the column (why we hold 1 constant), and for each row will change the column to zero
        k += 1 # increment row counter
      end
      zero += 1 #increments coordinates counter
    end
  end
  return matrix
end

# Checks that for the given matrix, where number of rows are equal to number of columns
# whether the sum of each row matches the sum of corresponding column i.e. sum
# of numbers in row i is the same as the sum of numbers in column i for i = 0 to row.length-1
# If this is the case, return true. Otherwise, return false.
# TC - O(n^2) - loop through nested while loops that are determined by the size of the matrix passed into the method.
# SC - O(1) - the number of variables and memory used is constant regardless of the size of the martix passed through the method. 
def matrix_check_sum(matrix)
  row_sum = 0
  column_sum = 0

  i = 0 # counter outer loop, rows

  while i < matrix.length # n rows
    j = 0 # innter loop counter, columns
    while j < matrix[i].length # columns
      # switch i and j, rows and columns so that we get both values and add to sum variable
      row_sum += matrix[i][j]
      column_sum += matrix[j][i]
      j += 1 # increment inner loop counter, columns
    end
    return false if row_sum != column_sum

    i += 1 # increment inner loop counter, rows
    # clear sum variables
    row_sum = 0
    column_sum = 0
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
