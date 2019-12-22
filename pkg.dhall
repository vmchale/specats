let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall sha256:33e41e509b6cfd0b075d1a8a5210ddfd1919372f9d972c2da783c6187d2298ba

in    λ(x : List Natural)
    →   prelude.dep
      ⫽ { libName = "specats"
        , dir = prelude.patsHome
        , url =
            "https://github.com/vmchale/specats/archive/${prelude.showVersion
                                                            x}.tar.gz"
        , libVersion = x
        }
