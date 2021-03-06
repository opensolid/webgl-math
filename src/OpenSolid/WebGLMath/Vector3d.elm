module OpenSolid.WebGLMath.Vector3d
    exposing
        ( transformBy
        )

{-| Transformation functions for `Vector3d`.

@docs transformBy

-}

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Vector3d as Vector3d
import Matrix4 exposing (Float4x4)


{-| Transform a `Vector3d` by a `Float4x4`; note that

    Vector3d.transformBy matrix vector

is similar to but *not* in general equivalent to

    Vector3d (Matrix4.transform matrix (Vector3d.components vector))

since `Matrix4.transform` implicitly assumes that the given argument represents
a point, not a vector, and therefore applies translation to it. Transforming a
vector by a 4x4 matrix should in fact ignore any translation component of the
matrix, which this function does. For example:

    vector =
        Vector3d ( 2, 1, 3 )

    -- 90 degree rotation around the Z axis, followed by a translation
    matrix =
        Matrix4.makeTranslate ( 5, 5, 5 )
            |> Matrix4.rotate (degrees 90) ( 0, 0, 1 )

    Vector3d.transformBy matrix vector
    --> Vector3d ( -1, 2, 3 )

-}
transformBy : Float4x4 -> Vector3d -> Vector3d
transformBy matrix vector =
    let
        ( ( m11, m12, m13, m14 ), ( m21, m22, m23, m24 ), ( m31, m32, m33, m34 ), ( m41, m42, m43, m44 ) ) =
            matrix

        ( x, y, z ) =
            Vector3d.components vector
    in
        Vector3d
            ( m11 * x + m12 * y + m13 * z
            , m21 * x + m22 * y + m23 * z
            , m31 * x + m32 * y + m33 * z
            )
