module Main exposing (..)

import Html
import Html.Attributes
import AdorableAvatars

main =
    let
        size =
            128
        identifier =
            "example-username"
    in
        Html.div []
            [ AdorableAvatars.img [] size identifier
            , Html.p [] [ Html.text (AdorableAvatars.buildUrl size identifier) ]
            ]
