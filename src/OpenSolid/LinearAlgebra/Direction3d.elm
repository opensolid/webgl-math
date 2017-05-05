module OpenSolid.LinearAlgebra.Direction3d
    exposing
        ( toVec3
        )

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Direction3d as Direction3d
import Math.Vector3 exposing (Vec3)


toVec3 : Direction3d -> Vec3
toVec3 vector =
    Math.Vector3.fromTuple (Direction3d.components vector)
