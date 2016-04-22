module Pangram where

import Regex
import List
import String

alphabet : List String
alphabet =
  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

isPangram : String -> Bool
isPangram input =
  let
    inputlist = List.map String.toLower (findChar input)
  in
    True


findChar : String -> List String
findChar input =
  Regex.find Regex.All (Regex.regex "[a-zA-Z]+") input
  |> List.map .match














-- Regex.contains (Regex.regex "[a-z]+?" |> Regex.caseInsensitive) input
