module MainTest exposing (..)

import Expect exposing (Expectation)
import Main
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test
suite =
    test "Outputs a nice hello message." <|
        \() ->
            Main.view (Main.Text "Hello, World!")
                |> Query.fromHtml
                |> Query.has [ text "Hello, World!" ]
