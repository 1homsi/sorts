function Heapsort(out Array<int> Arr)
{
    local int N = Arr.Length;
    local int I;
    
    for (I = N / 2 - 1; I >= 0; I--)
    {
        SiftDown(Arr, I, N);
    }
    
    for (I = N - 1; I > 0; I--)
    {
        local int Temp = Arr[0];
        Arr[0] = Arr[I];
        Arr[I] = Temp;
        SiftDown(Arr, 0, I);
    }
}

function SiftDown(out Array<int> Arr, int Idx, int N)
{
    local int Largest = Idx;
    local int Left = 2 * Idx + 1;
    local int Right = 2 * Idx + 2;
    
    if (Left < N && Arr[Left] > Arr[Largest])
    {
        Largest = Left;
    }
    if (Right < N && Arr[Right] > Arr[Largest])
    {
        Largest = Right;
    }
    if (Largest != Idx)
    {
        local int Temp = Arr[Idx];
        Arr[Idx] = Arr[Largest];
        Arr[Largest] = Temp;
        SiftDown(Arr, Largest, N);
    }
}

local Array<int> Arr;
Arr[0] = 5; Arr[1] = 2; Arr[2] = 8; Arr[3] = 1; Arr[4] = 9; Arr[5] = 3;
Heapsort(Arr);
