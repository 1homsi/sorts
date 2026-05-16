cycleSort(arr, n) = result
with {
  process = sort_loop(arr, 0, n);
  
  sort_loop(a, pos, n) = result
  with {
    result = select2(pos < n,
      a,
      sort_loop(update_cycle(a, pos, a(pos)), pos + 1, n)
    );
  };
  
  update_cycle(a, pos, item) = result
  with {
    cycles = count_less(a, pos, item);
    result = select2(cycles == 0,
      a,
      process_cycle(a, pos, item, cycles)
    );
  };
  
  count_less(a, pos, item) = sum(i, 0, n-1,
    select2((i != pos) & (a(i) < item), 1, 0)
  );
  
  process_cycle(a, pos, item, cycles) = result
  with {
    result = select2(cycles > 0,
      a,
      result
    );
  };
};
