module OpenSolid.LinearAlgebra.Vector3d
    exposing
        ( toVec3
        , fromVec3
        , transformBy
        )

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Vector3d as Vector3d
import Math.Vector3 exposing (Vec3)
import Math.Matrix4 exposing (Mat4)


toVec3 : Vector3d -> Vec3
toVec3 vector =
    Math.Vector3.fromTuple (Vector3d.components vector)


fromVec3 : Vec3 -> Vector3d
fromVec3 vec =
    Vector3d (Math.Vector3.toTuple vec)


transformBy : Mat4 -> Vector3d -> Vector3d
transformBy matrix vector =
    let
        { m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44 } =
            Math.Matrix4.toRecord matrix

        ( x, y, z ) =
            Vector3d.components vector
    in
        Vector3d
            ( m11 * x + m12 * y + m13 * z
            , m21 * x + m22 * y + m23 * z
            , m31 * x + m32 * y + m33 * z
            )
