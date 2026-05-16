def is_sorted(arr)
  arr.each_cons(2).all? { |a, b| a <= b }
end

def bogosort(arr)
  arr = arr.dup
  arr.shuffle! until is_sorted(arr)
  arr
end

task :default do
  arr = [3, 1, 4, 1, 5, 9, 2, 6]
  puts bogosort(arr).inspect
end
