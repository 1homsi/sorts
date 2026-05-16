static function array<int> CycleSort(out array<int> Arr)
{
  local int n, pos, item, cycles, i, temp;
  
  n = Arr.Length;
  pos = 0;
  
  while (pos < n)
  {
    item = Arr[pos];
    cycles = 0;
    
    for (i = 0; i < n; i++)
    {
      if (i != pos && Arr[i] < item)
      {
        cycles++;
      }
    }
    
    if (cycles != 0)
    {
      while (Arr[pos] == item)
      {
        pos++;
      }
      temp = Arr[pos];
      Arr[pos] = item;
      item = temp;
      
      while (cycles > 0)
      {
        cycles = 0;
        for (i = 0; i < n; i++)
        {
          if (i != pos && Arr[i] < item)
          {
            cycles++;
          }
        }
        
        while (Arr[pos] == item)
        {
          pos++;
        }
        temp = Arr[pos];
        Arr[pos] = item;
        item = temp;
        cycles--;
      }
    }
    
    pos++;
  }
  
  return Arr;
}
