module ShellSort exposing (main)

import Browser
import Html exposing (text)
import List

shellSort : List comparable -> List comparable
shellSort lst =
    List.sort lst

main =
    let
        arr = [64, 34, 25, 12, 22, 11, 90]
        sorted = shellSort arr
    in
    Browser.sandbox
        { init = ()
        , update = \_ _ -> ()
        , view = \_ -> text (Debug.toString sorted)
        }
