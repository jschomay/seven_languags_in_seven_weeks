module Day_1 where

import Graphics.Element exposing (..)
import List exposing (..)

add x y =
  x + y

product: List number -> number
-- product l =
--   List.foldl (*) 1 l
product l =
  case l of
    [] -> 0
    h::[] -> h
    h::t -> h * product t

xProp =
  List.map .x


multiply a b =
  if a == 0 then 0
  else if b == 0 then 0
  else if b == 1 then a
  else if b == -1 then -a
  else if b > 1 then a + multiply a (b - 1)
  else if b < -1 then -a - multiply -a (b + 1)
  else 0


jAddress = { street = "my street" }
person = { name = "Jeff", age = 34, address = jAddress }

type Address = Address String
type alias Name = String
type alias Age = Int
type Person = Person Name Age Address

jeff = Person "Jeff" 34 ( Address "my street" )

getAge p = case p of
  Person _ age _ -> age


people =
  [ {name = "Joe", age = Just 24}
  , {name = "Jim", age = Just 31}
  , {name = "Shorty", age = Just 11}
  , {name = "Shorty", age = Nothing}
  ]

olderThan16 =
  map .name << filter ( (<) 16 << .age )

maybeGt c n =
  case n of
    Nothing -> False
    Just x -> x > c

maybeOlderThan16 =
  map .name << filter ( maybeGt 16 << .age )
