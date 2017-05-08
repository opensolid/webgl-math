# opensolid/linear-algebra

This package supports interop between [`opensolid/geometry`](http://package.elm-lang.org/packages/opensolid/geometry/latest)
and [`elm-community/linear-algebra`](http://package.elm-lang.org/packages/elm-community/linear-algebra/latest).
You can:

  - Convert `opensolid/geometry` 2D/3D point, vector and direction values to and
    from `linear-algebra` `Vec2` and `Vec3` values
  - Convert `opensolid/geometry` `Frame3d` values to the equivalent
    `linear-algebra` `Mat4` transformation matrices
  - Transform `opensolid/geometry` `Point3d` and `Vector3d` values using
    `linear-algebra` `Mat4` transformation matrices

This is important for working with WebGL, since the [`elm-community/webgl`](http://package.elm-lang.org/packages/elm-community/webgl/latest)
package requires using `linear-algebra` types when defining meshes and shaders.
This package may also be useful when using other packages that accept or return
`linear-algebra` types, such as [`mkovacs/quaternion`](http://package.elm-lang.org/packages/mkovacs/quaternion/latest).
However, you shouldn't need this package for general use - you should be able to
do any sort of geometric transformation you need (rotations, translations etc.)
using OpenSolid itself.

## Installation

```
elm package install opensolid/linear-algebra
```

## Documentation

[Full API documentation](http://package.elm-lang.org/packages/opensolid/linear-algebra/1.0.0)
is available.

## Questions? Comments?

Please [open a new issue](https://github.com/opensolid/linear-algebra/issues) if
you run into a bug, if any documentation is missing/incorrect/confusing, or if
there's a new feature that you would find useful. For general questions about
using this package, try posting on:

  - [Elm Slack](http://elmlang.herokuapp.com/) (mention @ianmackenzie in your
    questions so I get a notification)
  - [Stack Overflow](https://stackoverflow.com/questions/ask?tags=opensolid+elm)
    (tag your question with 'opensolid' and 'elm')
  - The [r/elm](https://reddit.com/r/elm) subreddit
  - The [elm-discuss](https://groups.google.com/forum/#!forum/elm-discuss)
    Google Group
  - Or if you happen to be in the New York area, come on out to the
    [Elm NYC meetup](https://www.meetup.com/Elm-NYC/) =)

Have fun, and don't be afraid to ask for help!
