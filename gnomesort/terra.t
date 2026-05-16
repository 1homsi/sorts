local gnomesort = terra(arr : &int, len : int)
  var i = 0
  while i < len do
    if i == 0 then
      i = i + 1
    else
      if arr[i] < arr[i - 1] then
        var temp = arr[i]
        arr[i] = arr[i - 1]
        arr[i - 1] = temp
        i = i - 1
      else
        i = i + 1
      end
    end
  end
end

local arr = terralib.new(int[6], {5, 2, 8, 1, 9, 3})
gnomesort(arr, 6)

for i = 0, 6 do
  print(arr[i])
end
