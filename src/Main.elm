module Main exposing (..)

import Browser
import Html exposing (Html, text)
import Http


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type Model
    = Text String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Text "Hello, World!"
    , Http.get
        { url = "https://example.com"
        , expect = Http.expectString Response
        }
    )


type Msg
    = Response (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Response (Ok value) ->
            ( Text value, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view (Text value) =
    text value
