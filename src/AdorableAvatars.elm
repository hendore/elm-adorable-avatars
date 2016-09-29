module AdorableAvatars exposing (buildUrl, img)

{-| This library fills a bunch of important niches in Elm. A `Maybe` can help
you with optional arguments, error handling, and records with optional fields.

# Urls
@docs buildUrl

# View Helpers
@docs img

-}

import Html
import Html.Attributes
import String


{-| The adorable avatars base api url
-}
endpoint =
    "https://api.adorable.io/avatars"


{-| Returns a url to an adorable avatar.

    buildUrl 128 "foobar" == "https://api.adorable.io/avatars/128/foobar"
-}
buildUrl : Int -> String -> String
buildUrl size identifier =
    (String.join "/" [ endpoint, (toString size), identifier ]) ++ ".png"


{-| View helper for creating an img node.

    basic =
        img [] 128 "foobar"

    withAttributes =
        img [ class "round-img", alt "Foobars avatar" ] 128 "foobar"
-}
img : List (Html.Attribute msg) -> Int -> String -> Html.Html msg
img attributes size identifier =
    let
        src =
            buildUrl size identifier
    in
        Html.img (List.append attributes [ Html.Attributes.src src ]) []
