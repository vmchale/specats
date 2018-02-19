#define nil list_vt_nil
#define :: list_vt_cons

vtypedef named = @{ fst = string, snd = bool }
vtypedef test_tree = @{ group = string, leaves = List_vt(named) }

fn fail_incomplete(i : int, n : int) : void =
  {
    val _ = prerr!("\nTest suite complete (" + tostring_int(i) + "/" + tostring_int(n) + ")\n")
    val _ = if n != i then
      (exit(1) ; ())
    else
      ()
  }

fnx iterate_list(t : test_tree, i : int, n : int) : void =
  let
    val _ = if i = 0 then
      println!(t.group + ":")
    else
      ()
    
    fun handle_loop(s : string, b : bool, xs : test_tree) : void =
      if b then
        (println!("  \33[32msucceeded:\33[0m " + s) ; iterate_list(xs, i + 1, n))
      else
        (println!("  \33[31mfailed:\33[0m " + s) ; iterate_list(xs, i, n))
  in
    case+ t.leaves of
      | ~list_vt_nil() => fail_incomplete(i, n)
      | ~list_vt_cons (x, xs) => handle_loop(x.fst, x.snd, @{ group = t.group, leaves = xs })
  end