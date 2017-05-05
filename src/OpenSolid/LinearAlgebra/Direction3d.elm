module OpenSolid.LinearAlgebra.Direction3d
    exposing
        ( toVec3
        )

{-| Conversion functions for `Direction3d`.

@docs toVec3

-}

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Direction3d as Direction3d
import Math.Vector3 exposing (Vec3)


{-| Convert a `Direction3d` to a `Vec3`.

    Direction3d.toVec3 Direction3d.y
    --> Vector3.vec3 0 1 0

-}
toVec3 : Direction3d -> Vec3
toVec3 vector =
    Math.Vector3.fromTuple (Direction3d.components vector)
