module OpenSolid.LinearAlgebra.Vector2d
    exposing
        ( toVec2
        , fromVec2
        )

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Vector2d as Vector2d
import Math.Vector2 exposing (Vec2)


toVec2 : Vector2d -> Vec2
toVec2 vector =
    Math.Vector2.fromTuple (Vector2d.components vector)


fromVec2 : Vec2 -> Vector2d
fromVec2 vec =
    Vector2d (Math.Vector2.toTuple vec)
