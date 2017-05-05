module OpenSolid.LinearAlgebra.Point2d
    exposing
        ( toVec2
        , fromVec2
        )

{-| Conversion functions for `Point2d`.

@docs toVec2, fromVec2

-}

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Point2d as Point2d
import Math.Vector2 exposing (Vec2)


{-| Convert a `Point2d` to a `Vec2`.

    Point2d.toVec2 (Point2d ( 2, 3 ))
    --> Vector2.vec2 2 3

-}
toVec2 : Point2d -> Vec2
toVec2 point =
    Math.Vector2.fromTuple (Point2d.coordinates point)


{-| Convert a `Vec2` to a `Point2d`.

    Point2d.fromVec2 (Vector2.vec2 2 3)
    --> Point2d ( 2, 3 )

-}
fromVec2 : Vec2 -> Point2d
fromVec2 vec =
    Point2d (Math.Vector2.toTuple vec)
