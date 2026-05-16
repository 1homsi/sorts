; bogosort IR
loop:
  cmp sorted, 1
  je done
  call shuffle
  jmp loop
done:
