defmodule Bogosort do
    def bogosort(list) do
        if sorted?(list) do
            list
        else
            list |> Enum.shuffle() |> bogosort()
        end
    end
    
    defp sorted?([]), do: true
    defp sorted?([_]), do: true
    defp sorted?([a, b | rest]), do: a <= b and sorted?([b | rest])
end
