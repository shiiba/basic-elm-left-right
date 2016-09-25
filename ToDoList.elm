import Html exposing (..)
import Html.App as App
import Mouse

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- INIT (MODEL)

type alias Model =
    { mouseX : number
    , maxScreen : number
    , leftText : String
    , rightText : String
    }

init : (Model, Cmd Msg)
init =
    0 0 "" ""

-- UPDATE

type Msg
    = GetMouseX
    | GetMaxScreen
    | SwitchLeft
    | SwitchRight

update : Msg -> Model -> (Model, Cmd Msg)


--sideCalc : number -> number -> String
--sideCalc x maxScreen =
--    if maxScreen / 2 > x then "Left" else "Right"

-- SUBSCRIPTIONS



-- VIEW

view : Model -> Html Msg

