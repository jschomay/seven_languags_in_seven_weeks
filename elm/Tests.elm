module Tests where

import ElmTest exposing (..)

import String
import Day_1


all : Test
all =
  suite "day 1"
  [
    test "add" (assertEqual (Day_1.add 4 6) 10)

  , test "product" (assertEqual (Day_1.product [2, 3, 4]) ( 2 * 3 * 4 ) )
  , test "product (of empty list)" (assertEqual (Day_1.product []) 0 )

  , test "xProp" (assertEqual [1,3,4] (Day_1.xProp [{x = 1, y = 2}, {x = 3, y = 4}, {x = 4, y = 6}]) )

  , suite "multiply"
    [
      ( 6 * 4 ) `equals` ( Day_1.multiply 6 4 )
    , ( 1 * 9 ) `equals` ( Day_1.multiply 1 9 )
    , ( Day_1.multiply 9 1 ) `equals` ( Day_1.multiply 1 9 )
    , ( 6 * -4 ) `equals` ( Day_1.multiply 6 -4 )
    , ( 6 * -5 ) `equals` ( Day_1.multiply 6 -5 )
    , ( -6 * -4 ) `equals` ( Day_1.multiply -6 -4 )
    , ( 0 * 4 ) `equals` ( Day_1.multiply 0 4 )
    , ( 4 * 0 ) `equals` ( Day_1.multiply 4 0 )
    ]
  ]
