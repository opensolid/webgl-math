module OpenSolid.LinearAlgebra.Vector2d
    exposing
        ( toVec2
        , fromVec2
        )

{-| Conversion functions for `Vector2d`.

@docs toVec2, fromVec2

-}

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Vector2d as Vector2d
import Math.Vector2 exposing (Vec2)


{-| Convert a `Vector2d` to a `Vec2`.

    Vector2d.toVec2 (Vector2d ( 2, 3 ))
    --> Vector2.vec2 2 3

-}
toVec2 : Vector2d -> Vec2
toVec2 vector =
    Math.Vector2.fromTuple (Vector2d.components vector)


{-| Convert a `Vec2` to a `Vector2d`.

    Vector2d.fromVec2 (Vector2.vec2 2 3)
    --> Vector2d ( 2, 3 )

-}
fromVec2 : Vec2 -> Vector2d
fromVec2 vec =
    Vector2d (Math.Vector2.toTuple vec)
