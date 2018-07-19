vtypedef named_test = @{ test_name = string, test_result = bool }
vtypedef test_tree = @{ group = string, leaves = List_vt(named_test) }

fun fail_incomplete(i : int, n : int) : void

fun iterate_list(t : test_tree, i : int, n : int) : void
