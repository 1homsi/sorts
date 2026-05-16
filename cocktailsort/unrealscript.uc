class CocktailSort extends Object;

static function CocktailSort(out array<int> Arr)
{
    local int N, I, K, Temp;
    local bool Swapped;
    
    N = Arr.Length;
    I = 0;
    
    while (I < N)
    {
        Swapped = false;
        for (K = 0; K < N - I - 1; K++)
        {
            if (Arr[K] > Arr[K + 1])
            {
                Temp = Arr[K];
                Arr[K] = Arr[K + 1];
                Arr[K + 1] = Temp;
                Swapped = true;
            }
        }
        if (!Swapped) break;
        I++;
        Swapped = false;
        for (K = N - I - 2; K >= 0; K--)
        {
            if (Arr[K] > Arr[K + 1])
            {
                Temp = Arr[K];
                Arr[K] = Arr[K + 1];
                Arr[K + 1] = Temp;
                Swapped = true;
            }
        }
        if (!Swapped) break;
        I++;
    }
}

static function main()
{
    local array<int> Arr;
    Arr[0] = 5;
    Arr[1] = 2;
    Arr[2] = 8;
    Arr[3] = 1;
    Arr[4] = 9;
    Arr[5] = 3;
    CocktailSort(Arr);
}
