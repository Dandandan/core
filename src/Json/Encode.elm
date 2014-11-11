
module Json.Encode where

{-| Library for turning Elm values into JSON values.

# To String
@docs toString

# Primatives
@docs string, int, float, bool, null

# Arrays
@docs list, array

# Objects
@docs object
-}

import Array (Array)
import Native.Json


type Json = Json


{-| Convert a `Json` into a prettified string. The first argument specifies
the amount of indentation in the resulting string.

    person =
        object
          [ ("name", string "Tom")
          , ("age", int 42)
          ]

    compact = encode 0 person
    -- {"name":"Tom","age":42}

    readable = encode 4 person
    -- {
    --     "name": "Tom",
    --     "age": 42
    -- }
-}
encode : Int -> Json -> String
encode =
    Native.Json.encode


string : String -> Json
string =
    Native.Json.identity

int : Int -> Json
int =
    Native.Json.identity


float : Float -> Json
float =
    Native.Json.identity


bool : Bool -> Json
bool =
    Native.Json.identity


null : Json
null =
    Native.Json.encodeNull


object : [(String, Json)] -> Json
object =
    Native.Json.encodeObject


array : Array Json -> Json
array =
    Native.Json.encodeArray


list : [Json] -> Json
list =
    Native.Json.encodeList