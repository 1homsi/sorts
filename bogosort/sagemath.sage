function y = bogosort(x)
  while ~issorted(x)
    x = x(randperm(length(x)));
  end
  y = x;
end
