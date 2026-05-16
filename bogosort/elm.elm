module Main exposing (..)

import List exposing (map2, length)
import Random exposing (Generator, generate, list, int)
import Browser

isSorted : List Int -> Bool
isSorted arr =
    case arr of
        [] -> True
        [_] -> True
        x :: y :: rest -> x <= y && isSorted (y :: rest)

type alias Model = List Int

type Msg = Shuffled (List Int)

init : Model
init = [3, 1, 4, 1, 5, 9, 2, 6]

update : Msg -> Model -> (Model, Cmd Msg)
update (Shuffled newArr) _ =
    if isSorted newArr then
        (newArr, Cmd.none)
    else
        (newArr, generate Shuffled (shuffleGen newArr))

shuffleGen : List Int -> Generator (List Int)
shuffleGen arr =
    Random.map (\_ -> arr) (Random.int 0 1)

main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> (init, Cmd.none)
        , update = update
        , view = \_ -> Html.text ""
        , subscriptions = \_ -> Sub.none
        }
