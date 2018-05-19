vtypedef named = @{ fst = string, snd = bool }
vtypedef test_tree = @{ group = string, leaves = List_vt(named) }

fun fail_incomplete(i : int, n : int) : void

fun iterate_list(t : test_tree, i : int, n : int) : void
