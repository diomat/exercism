module Raindrops (..) where

import String

raindrops : Int -> String
raindrops number =
  let
    pling = isDividableBy 3 number
    plang = isDividableBy 5 number
    plong = isDividableBy 7 number
    result = pling ++ plang ++ plong
  in
    if (String.isEmpty result) then
      toString number
    else
      result

isDividableBy : Int -> Int -> String
isDividableBy divisor number =
  case divisor of
    3 -> if (number % divisor == 0) then "Pling" else ""
    5 -> if (number % divisor == 0) then "Plang" else ""
    7 -> if (number % divisor == 0) then "Plong" else ""
    _ -> ""
