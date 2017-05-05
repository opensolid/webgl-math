module OpenSolid.LinearAlgebra.Frame3d
    exposing
        ( toMat4
        )

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Direction3d as Direction3d
import OpenSolid.Point3d as Point3d
import OpenSolid.Frame3d as Frame3d
import Math.Matrix4 exposing (Mat4)


toMat4 : Frame3d -> Mat4
toMat4 frame =
    let
        ( m11, m21, m31 ) =
            Direction3d.components (Frame3d.xDirection frame)

        ( m12, m22, m32 ) =
            Direction3d.components (Frame3d.yDirection frame)

        ( m13, m23, m33 ) =
            Direction3d.components (Frame3d.zDirection frame)

        ( m14, m24, m34 ) =
            Point3d.coordinates (Frame3d.originPoint frame)
    in
        Math.Matrix4.fromRecord
            { m11 = m11
            , m21 = m21
            , m31 = m31
            , m41 = 0
            , m12 = m12
            , m22 = m22
            , m32 = m32
            , m42 = 0
            , m13 = m13
            , m23 = m23
            , m33 = m33
            , m43 = 0
            , m14 = m14
            , m24 = m24
            , m34 = m34
            , m44 = 1
            }
