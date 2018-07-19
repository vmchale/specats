#include "share/atspre_staload.hats"
#include "./mylibies.hats"

implement main0 () =
  {
    var b = true
    var n = @{ test_name = "test", test_result = b }
    var xs = n :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "Default", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }
