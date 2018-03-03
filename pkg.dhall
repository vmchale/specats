let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in λ(x : List Integer) → 
  prelude.dep //
    { libName = "specats"
    , dir = ".atspkg/contrib"
    , url = "https://github.com/vmchale/specats/archive/${prelude.showVersion x}.tar.gz"
    , libVersion = x
    }
