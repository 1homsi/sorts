functor
import
    System
    Application
define
    proc {StoogeSort Arr First Last}
        A = {Array.get Arr First}
        B = {Array.get Arr Last}
    in
        if A > B then
            {Array.put Arr First B}
            {Array.put Arr Last A}
        end
        N = Last - First + 1
    in
        if N > 2 then
            T = N * 2 div 3
        in
            {StoogeSort Arr First First+T-1}
            {StoogeSort Arr Last-T+1 Last}
            {StoogeSort Arr First First+T-1}
        end
    end

    Arr = {Array.new 0 7 0}
    {Array.put Arr 0 3} {Array.put Arr 1 1} {Array.put Arr 2 4} {Array.put Arr 3 1}
    {Array.put Arr 4 5} {Array.put Arr 5 9} {Array.put Arr 6 2} {Array.put Arr 7 6}
    {StoogeSort Arr 0 7}
    for I in 0..7 do
        {System.print {Array.get Arr I}} {System.print ' '}
    end
    {System.printInfo "\n"}
    {Application.exit 0}
end
