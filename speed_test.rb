
def length(num)
  return 0 if num == 0
  count = 0
  until num == 0
    num /= 10
    count += 1
  end
  return count
end

i = 100_000_000
begin_time = Time.now
# 4 seconds @ 10,000,000
# 40 seconds @ 100,000,000
i.times {length(123456)}
puts "Time to run method 1 #{i} times: #{Time.now - begin_time} seconds"

begin_time = Time.now
# 1.7 seconds @ 10,000,000
# 17 seconds @ 100,000,000
i.times {123456.to_s.length}
puts "Time to run method 2 #{i} times: #{Time.now - begin_time} seconds"

# conclusions: both are linear
# n.to_s.length is approx. twice as fast
