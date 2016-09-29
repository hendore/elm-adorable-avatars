module Main exposing (..)

import Html
import Html.App
import Html.Attributes
import Html.Events
import AdorableAvatars


type alias Model =
    { identifier : Maybe String
    , size : Int
    }


initialModel =
    Model "example@email.com" 128


view { size, identifier } =
    AdorableAvatars.img [] size identifier


main =
    Html.App.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
