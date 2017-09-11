module AdorableAvatars exposing (buildUrl, img)

{-| Simple, elegant and adorable avatars provided by
[http://avatars.adorable.io](http://avatars.adorable.io/).

# Urls
@docs buildUrl

# View Helpers
@docs img
-}

import Html
import Html.Attributes
import String


{-| The adorable avatars base api url.
-}
endpoint =
    "https://api.adorable.io/avatars"


{-| Builds a url to an adorable avatar from *size* and *identifier*.

    buildUrl 128 "foobar" == "https://api.adorable.io/avatars/128/foobar"
-}
buildUrl : Int -> String -> String
buildUrl size identifier =
    String.join "/" [ endpoint, (toString size), identifier ]


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
