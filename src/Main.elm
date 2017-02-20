module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type alias Model = {
  inputText : String
  , outputText : String
}


model : Model
model = {
  inputText = ""
  , outputText = ""
  }



-- UPDATE

type Msg = UpdateInputText String


update : Msg -> Model -> Model
update message model =
  case message of
    UpdateInputText userText ->
      { model | outputText = String.reverse userText }



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput UpdateInputText ] []
    , div [] [ text (model.outputText) ]
    ]
