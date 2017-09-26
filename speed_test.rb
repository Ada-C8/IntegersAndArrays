# INTEGER LENGTH TESTS
def length(num)
  return 0 if num == 0
  count = 0
  until num == 0
    num /= 10
    count += 1
  end
  return count
end

i = 100_000
begin_time = Time.now
# 0.088374 seconds @ 10,000
# 6.928259 seconds @ 100,000
# 60.381783 seconds @ 300,000
# ~78, ~10
num = i.times.map{rand(10)}.join.to_i
# length(num)
puts "Time to run method 1 #{i} times: #{Time.now - begin_time} seconds"

begin_time = Time.now
# 0.000442 seconds @ 10,000
# 0.017784 seconds @ 100,000
# 0.075978 seconds @ 300,000
# ~40, ~4
# num.to_s.length
puts "Time to run method 2 #{i} times: #{Time.now - begin_time} seconds"

# conclusions:
# #length is O(n)
# .to_s.length is a lot faster to begin with and grows at less than half the rate - logarithmic?


# ARRAY INTERSECTION TESTS

def intersection_1(array_1, array_2)
  result = []
  array_1.each do |n|
    array_2.each do |m|
      if n == m
        result << n
      end
    end
  end
  return result
end

def intersection_2(array_1, array_2)
  array_1.sort!
  array_2.sort!
  result = []
  array_1.each do |n|
    min = 0
    max = array_2.length
    until min >= max
      mid = (min + max) / 2
      # puts "min is #{min}, max is #{max}, mid is #{mid}, seeking #{n}"
      if array_2[mid] == n
        result << n
        break
      elsif array_2[mid] > n
        max = mid
      else
        min = mid + 1
      end
    end
  end
  return result
end

i = 8
array_1 = Array.new(i){rand(100)}
array_2 = Array.new(i){rand(100)}

begin_time = Time.now
i.times {intersection_1(array_1, array_2)}
puts "Time to run method 1 with n of #{i}: #{Time.now - begin_time} seconds"
# 4.5e-05 seconds @ 8
# 7.6e-05 seconds @ 10
# 0.05827 seconds @ 100
# 0.467211 seconds @ 200
# 1.590862 seconds @ 300
# 7.427812 seconds @ 500
# 64.432914 seconds @ 1000

begin_time = Time.now
i.times {intersection_2(array_1, array_2)}
puts "Time to run method 2 with n of #{i}: #{Time.now - begin_time} seconds"
# 5.0e-05 seconds @ 8
# 6.4e-05 seconds @ 10
# 0.00771 seconds @ 100
# 0.035909 seconds @ 200
# 0.074283 seconds @ 300
# 0.196827 seconds @ 500
# 1.052188 seconds @ 1000
# 75.814782 seconds @ 10,000

# conclusions: method 1 is O(n^2), method 2 is O(nlogn) - much better rate of growth
# for smaller arrays (n < 9 where n = array.length and array 1.length == array 2.length) method 1 is infinitesimally faster
