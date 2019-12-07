let prelude = http://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall sha256:33e41e509b6cfd0b075d1a8a5210ddfd1919372f9d972c2da783c6187d2298ba
in

prelude.default ⫽
  { test =
    [ prelude.bin ⫽
      { src = "example.dats"
      , target = "target/test"
      , gcBin = True
      }
    ]
  }
