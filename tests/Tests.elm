module Tests exposing (..)

import Test exposing (Test)
import Expect
import Fuzz
import OpenSolid.Geometry.Fuzz as Fuzz
import OpenSolid.Geometry.Expect as Expect
import OpenSolid.Point3d as Point3d
import OpenSolid.Vector3d as Vector3d
import OpenSolid.Direction2d as Direction2d
import OpenSolid.Direction3d as Direction3d
import OpenSolid.LinearAlgebra.Vector2d as Vector2d
import OpenSolid.LinearAlgebra.Vector3d as Vector3d
import OpenSolid.LinearAlgebra.Direction2d as Direction2d
import OpenSolid.LinearAlgebra.Direction3d as Direction3d
import OpenSolid.LinearAlgebra.Point2d as Point2d
import OpenSolid.LinearAlgebra.Point3d as Point3d
import OpenSolid.LinearAlgebra.Frame3d as Frame3d
import Math.Matrix4
import Math.Vector3


vector2dConversionRoundTrips : Test
vector2dConversionRoundTrips =
    Test.fuzz Fuzz.vector2d
        "Vector2d conversion round-trips"
        (\vector ->
            vector
                |> Vector2d.toVec2
                |> Vector2d.fromVec2
                |> Expect.vector2dWithin 1.0e-6 vector
        )


vector3dConversionRoundTrips : Test
vector3dConversionRoundTrips =
    Test.fuzz Fuzz.vector3d
        "Vector3d conversion round-trips"
        (\vector ->
            vector
                |> Vector3d.toVec3
                |> Vector3d.fromVec3
                |> Expect.vector3dWithin 1.0e-6 vector
        )


direction2dConversionRoundTrips : Test
direction2dConversionRoundTrips =
    Test.fuzz Fuzz.direction2d
        "Direction2d conversion round-trips"
        (\direction ->
            direction
                |> Direction2d.toVec2
                |> Vector2d.fromVec2
                |> Expect.vector2dWithin 1.0e-6 (Direction2d.toVector direction)
        )


direction3dConversionRoundTrips : Test
direction3dConversionRoundTrips =
    Test.fuzz Fuzz.direction3d
        "Direction3d conversion round-trips"
        (\direction ->
            direction
                |> Direction3d.toVec3
                |> Vector3d.fromVec3
                |> Expect.vector3dWithin 1.0e-6 (Direction3d.toVector direction)
        )


point2dConversionRoundTrips : Test
point2dConversionRoundTrips =
    Test.fuzz Fuzz.point2d
        "Point2d conversion round-trips"
        (\point ->
            point
                |> Point2d.toVec2
                |> Point2d.fromVec2
                |> Expect.point2dWithin 1.0e-6 point
        )


point3dConversionRoundTrips : Test
point3dConversionRoundTrips =
    Test.fuzz Fuzz.point3d
        "Point3d conversion round-trips"
        (\point ->
            point
                |> Point3d.toVec3
                |> Point3d.fromVec3
                |> Expect.point3dWithin 1.0e-6 point
        )


point3dPlaceInIsTransform : Test
point3dPlaceInIsTransform =
    Test.fuzz2 Fuzz.point3d
        Fuzz.frame3d
        "Point3d.placeIn is equivalent to transform with Frame3d.toMat4"
        (\point frame ->
            point
                |> Point3d.toVec3
                |> (Math.Matrix4.transform (Frame3d.toMat4 frame))
                |> Point3d.fromVec3
                |> Expect.point3dWithin 1.0e-6 (Point3d.placeIn frame point)
        )


vector3dPlaceInIsTransform : Test
vector3dPlaceInIsTransform =
    let
        transformVec mat vec =
            Math.Vector3.sub
                (Math.Matrix4.transform mat vec)
                (Math.Matrix4.transform mat (Math.Vector3.vec3 0 0 0))
    in
        Test.fuzz2 Fuzz.vector3d
            Fuzz.frame3d
            "Vector3d.placeIn is equivalent to transform with Frame3d.toMat4"
            (\vector frame ->
                vector
                    |> Vector3d.toVec3
                    |> transformVec (Frame3d.toMat4 frame)
                    |> Vector3d.fromVec3
                    |> Expect.vector3dWithin 1.0e-6 (Vector3d.placeIn frame vector)
            )


point3dPlaceInIsTransformBy : Test
point3dPlaceInIsTransformBy =
    Test.fuzz2 Fuzz.point3d
        Fuzz.frame3d
        "Point3d.placeIn is equivalent to transformBy with Frame3d.toMat4"
        (\point frame ->
            point
                |> Point3d.transformBy (Frame3d.toMat4 frame)
                |> Expect.point3dWithin 1.0e-6 (Point3d.placeIn frame point)
        )


vector3dPlaceInIsTransformBy : Test
vector3dPlaceInIsTransformBy =
    Test.fuzz2 Fuzz.vector3d
        Fuzz.frame3d
        "Vector3d.placeIn is equivalent to transformBy with Frame3d.toMat4"
        (\vector frame ->
            vector
                |> Vector3d.transformBy (Frame3d.toMat4 frame)
                |> Expect.vector3dWithin 1.0e-6 (Vector3d.placeIn frame vector)
        )


all : Test
all =
    Test.describe "OpenSolid.LinearAlgebra"
        [ vector2dConversionRoundTrips
        , vector3dConversionRoundTrips
        , direction2dConversionRoundTrips
        , direction3dConversionRoundTrips
        , point2dConversionRoundTrips
        , point3dConversionRoundTrips
        , point3dPlaceInIsTransform
        , vector3dPlaceInIsTransform
        , point3dPlaceInIsTransformBy
        , vector3dPlaceInIsTransformBy
        ]
