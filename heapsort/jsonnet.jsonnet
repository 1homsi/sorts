local heapify(arr, n, i) =
  local left = 2 * i + 1;
  local right = 2 * i + 2;
  local largest0 = if left < n && arr[left] > arr[i] then left else i;
  local largest = if right < n && arr[right] > arr[largest0] then right else largest0;
  if largest != i then
    local arr2 = [if k == i then arr[largest] else if k == largest then arr[i] else arr[k] for k in std.range(0, std.length(arr)-1)];
    heapify(arr2, n, largest)
  else arr;

local heapsort(arr) =
  local n = std.length(arr);
  local buildStep(a, i) = heapify(a, n, i);
  local heap = std.foldl(buildStep, std.reverse(std.range(0, n/2 - 1)), arr);
  local sortStep(a, i) =
    local v0 = a[0]; local vi = a[i];
    local a2 = [if k == 0 then vi else if k == i then v0 else a[k] for k in std.range(0, n-1)];
    heapify(a2, i, 0);
  std.foldl(sortStep, std.reverse(std.range(1, n-1)), heap);

heapsort([12, 11, 13, 5, 6, 7])
