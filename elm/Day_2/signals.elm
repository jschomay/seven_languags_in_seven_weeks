import Mouse
import Signal exposing (..)
import Graphics.Element exposing (..)
import Time

output a b =
  flow down [show a, show b]

positionAndIsDown =
  map2 output Mouse.position Mouse.isDown

-----------------

showYOnDown =
  map show <| sampleOn Mouse.isDown Mouse.y

-----

showWhileDown a b =
  case a of
    True -> show b
    False -> show "(drag to see y coord)"

showYWhileDown =
  map2 showWhileDown Mouse.isDown Mouse.y

----

showLastKnowY =
  let
    prettyShow x =
      case x of
        Nothing -> show "drag to record y value"
        Just x -> show <| "Last known y: " ++ (toString x)

    yWhileDragging isDown y =
      case isDown of
        True -> Just y
        False -> Nothing

    yPos =
      map2 yWhileDragging Mouse.isDown Mouse.y

    exists x =
      case x of
        Nothing -> False
        _ -> True

    lastKnownY =
      filter exists Nothing yPos

  in
    map prettyShow lastKnownY

----

countUp =
  foldp (+) 0 <| map (always 1) (Time.every Time.second)

main = map show countUp

