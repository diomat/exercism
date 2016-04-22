module Bob where

import String exposing ( endsWith, isEmpty, all, filter, trim, length )
import Char exposing ( isUpper, isOctDigit, isHexDigit, toCode )
import Regex
import List

hey : String -> String
hey text =
  -- isEmpty also counts whitespace hence we trim the text
  if isEmpty (trim text) then
    "Fine. Be that way!"
  else if isShouting text then
    "Whoa, chill out!"
  else if endsWith "?" text then
    "Sure."
  else
    "Whatever."

isShouting : String -> Bool
isShouting input =
  let
    input' = Regex.find Regex.All (Regex.regex "[A-Za-z]+") input
      |> List.map .match |> String.concat
  in
    if not (isEmpty input') && all isUpper input' then
      True
    else
      False
