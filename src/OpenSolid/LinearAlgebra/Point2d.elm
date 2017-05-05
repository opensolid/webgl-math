module OpenSolid.LinearAlgebra.Point2d
    exposing
        ( toVec2
        , fromVec2
        )

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Point2d as Point2d
import Math.Vector2 exposing (Vec2)


toVec2 : Point2d -> Vec2
toVec2 point =
    Math.Vector2.fromTuple (Point2d.coordinates point)


fromVec2 : Vec2 -> Point2d
fromVec2 vec =
    Point2d (Math.Vector2.toTuple vec)
