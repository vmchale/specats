let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in λ(x : List Natural) →
  prelude.dep ⫽
    { libName = "specats"
    , dir = prelude.patsHome
    , url = "https://github.com/vmchale/specats/archive/${prelude.showVersion x}.tar.gz"
    , libVersion = x
    }
