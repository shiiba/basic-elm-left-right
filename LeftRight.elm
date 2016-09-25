import Html exposing (..)
import Html.App as App
import Mouse
import Window
import Task

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- INIT (MODEL)

type alias Model =
    { mouseX : Int
    , maxScreen : Int
    }

init : (Model, Cmd Msg)
init =
    ({ mouseX = 0, maxScreen = 0 }, getInitialWindow)

getInitialWindow : Cmd Msg
getInitialWindow = Task.perform ( \x -> SetMaxScreen 500 ) ( \maxScreen -> SetMaxScreen maxScreen ) Window.width

-- UPDATE

type Msg
    = SetMouseX Int
    | SetMaxScreen Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SetMouseX newX -> ({ model | mouseX = newX }, Cmd.none)
        SetMaxScreen newScreenX -> ({ model | maxScreen = newScreenX }, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
    Mouse.moves (\position -> SetMouseX position.x)

-- VIEW

view : Model -> Html Msg
view model =
    let
        screenText =
            if model.maxScreen // 2 > model.mouseX then "Left" else "Right"
    in
        Html.text screenText

