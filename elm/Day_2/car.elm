import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)
import Signal exposing (..)
import Color exposing (..)
import Window exposing (..)
import Mouse exposing (..)
import Text exposing (..)

drawCar carWidth x =
  group 
    [ filled red (rect carWidth 50)
    , filled red (rect (carWidth / 2) 40) |> move (0, 40)
    , filled black (circle 20) |> move (-50, -30)
    , filled black (circle 20) |> move (50, -30)
    ]
      |> move (x,0)

display ((w, h), carWidth, x, speed) = flow down
  [ show ("Speed: " ++ (toString (round speed)))
  , collage w h [ drawCar carWidth (toFloat x) ]
  ]

update (windowDimentions, mouseX) acc =
  let (_, carWidth, position, oldSpeed) = acc
      (w,_) = windowDimentions
      speed = (if oldSpeed < 0 then -1 else 1) * 10 * toFloat mouseX / (toFloat w / 2)
  in if (toFloat position) > (toFloat w / 2) - carWidth / 2
        || (toFloat position) < (0 - toFloat w / 2) + carWidth / 2
        then (windowDimentions, carWidth, position - round speed, -speed)
        else (windowDimentions, carWidth, position + round speed, speed)

main =
  let x = 0
      carWidth = 160
  in sampleOn (Time.fps 60) Mouse.x
     |> map2 (,) Window.dimensions
     |> foldp update ((100,100), carWidth, x, 0)
     |> map display
