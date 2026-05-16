class BitonicSort extends Object;

static function BitonicSort(out array<int> Arr, int Lo, int Cnt, int Dir)
{
    local int K;
    if (Cnt > 1)
    {
        K = Cnt / 2;
        BitonicSort(Arr, Lo, K, 1);
        BitonicSort(Arr, Lo + K, K, 0);
        BitonicMerge(Arr, Lo, Cnt, Dir);
    }
}

static function BitonicMerge(out array<int> Arr, int Lo, int Cnt, int Dir)
{
    local int K, I, Tmp;
    if (Cnt > 1)
    {
        K = Cnt / 2;
        for (I = Lo; I < Lo + Cnt - K; I++)
        {
            if ((Arr[I] > Arr[I + K]) == (Dir == 1))
            {
                Tmp = Arr[I];
                Arr[I] = Arr[I + K];
                Arr[I + K] = Tmp;
            }
        }
        BitonicMerge(Arr, Lo, K, Dir);
        BitonicMerge(Arr, Lo + K, K, Dir);
    }
}

defaultproperties
{
}
