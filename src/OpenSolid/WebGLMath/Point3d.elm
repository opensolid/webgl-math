module OpenSolid.WebGLMath.Point3d
    exposing
        ( transformBy
        )

{-| Transformation functions for `Point3d`.

@docs transformBy

-}

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Point3d as Point3d
import Matrix4 exposing (Float4x4)


{-| Transform a `Point3d` by a `Float4x4`;

    Point3d.transformBy matrix point

is equivalent to

    Point3d (Matrix4.transform matrix (Point3d.coordinates point))

For example:

    point =
        Point3d ( 2, 1, 3 )

    matrix =
        Matrix4.makeTranslate ( 3, 4, 5 )

    Point3d.transformBy matrix point
    --> Point3d ( 5, 5, 8 )

-}
transformBy : Float4x4 -> Point3d -> Point3d
transformBy matrix point =
    Point3d (Matrix4.transform matrix (Point3d.coordinates point))
