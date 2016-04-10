module Bob where

import String exposing ( endsWith, isEmpty, all, filter, trim, length )
import Char exposing ( isUpper, isOctDigit, isHexDigit, toCode )

hey : String -> String
hey text =
  -- isEmpty also counts whitespace hence we trim the text
  if isEmpty (trim text) then
    "Fine. Be that way!"
  else if isShouting text then
    "Whoa, chill out!"
  else if isQuestion text then
    "Sure."
  else
    "Whatever."

-- True when text ends with question mark
isQuestion : String -> Bool
isQuestion text =
  if endsWith "?" text then
    True
  else
    False

isShouting : String -> Bool
isShouting text =
  let
    text' = clearText text
  in
    -- isUpper evaluates an empty string to 'true' so we check if it's empty first
    if not (isEmpty text') && all isUpper text' then
      True
    else
      False

-- Clears a string from numbers and special characters (e.g. '%', '+', '!')
clearText : String -> String
clearText text =
  filter isCharacter text

-- True if character is between a-z or A-Z
-- TODO: Works only with ASCII?
isCharacter : Char -> Bool
isCharacter char =
  isBetween 'a' 'z' char || isBetween 'A' 'Z' char

-- Stolen from https://github.com/elm-lang/core/blob/master/src/Char.elm
isBetween : Char -> Char -> Char -> Bool
isBetween low high char =
  let code = toCode char
  in
      (code >= toCode low) && (code <= toCode high)