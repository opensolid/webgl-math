module OpenSolid.LinearAlgebra.Direction2d
    exposing
        ( toVec2
        )

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Direction2d as Direction2d
import Math.Vector2 exposing (Vec2)


toVec2 : Direction2d -> Vec2
toVec2 direction =
    Math.Vector2.fromTuple (Direction2d.components direction)
