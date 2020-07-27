let prelude =
      https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in  λ(x : List Natural) →
        prelude.dep
      ⫽ { libName = "specats"
        , dir = prelude.patsHome
        , url =
            "https://github.com/vmchale/specats/archive/${prelude.showVersion
                                                            x}.tar.gz"
        , libVersion = x
        }
