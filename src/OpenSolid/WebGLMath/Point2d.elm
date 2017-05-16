module OpenSolid.WebGLMath.Point2d
    exposing
        ( transformBy
        )

{-| Transformation functions for `Point2d`.

@docs transformBy

-}

import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Point2d as Point2d
import Matrix3 exposing (Float3x3)


{-| Transform a `Point2d` by a `Float3x3`;

    Point2d.transformBy matrix point

is equivalent to

    Point2d (Matrix3.transform matrix (Point2d.coordinates point))

For example:

    point =
        Point2d ( 2, 1  )

    -- Translation by (5, 5)
    matrix =
        ( ( 1, 0, 5 )
        , ( 0, 1, 5 )
        , ( 0, 0, 1)
        )

    Point2d.transformBy matrix point
    --> Point2d ( 7, 6 )

-}
transformBy : Float3x3 -> Point2d -> Point2d
transformBy matrix point =
    Point2d (Matrix3.transform matrix (Point2d.coordinates point))
