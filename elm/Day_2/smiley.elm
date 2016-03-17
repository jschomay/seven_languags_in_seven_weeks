import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Color exposing (..)
import Mouse
import Window
import Signal exposing (..)
import List
import Time exposing (fps)

arc : (Float, Float, Float) -> List (Float, Float)
arc (radius, alpha, beta) =
  let circlePoint angle = (radius * sin angle, radius * cos angle)
  in  [alpha..beta] |> List.map (\x -> x / 100) |> List.map circlePoint 

smiley x y =
  let style = { defaultLine | width = 5 }
  in
  group
    [ filled yellow (circle 200)
    , filled black (oval 50 90) |> move (60 + x/20, 50 - y/30)
    , filled black (oval 50 90) |> move (-60 + x/20, 50 - y/30)
    , arc (100, 0, 200) |> path |> traced style |> rotate (degrees -120) |> move (0, -20)
    ]

draw (w,h) (x, y) =
  let
    x' = toFloat x - toFloat w / 2
    y' =  toFloat y - toFloat h /2
  in
    collage w h [ smiley x' y' |> move (x'/2, -y'/2) ]

main =
  map2 draw Window.dimensions (sampleOn (fps 60) Mouse.position)

