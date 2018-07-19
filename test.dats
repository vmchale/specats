staload "./test.sats"
staload "libats/ML/SATS/string.sats"
staload _ = "libats/ML/DATS/string.dats"

implement fail_incomplete (i, n) =
  {
    val _ = prerr!("\nTest suite complete (" + tostring_int(i) + "/" + tostring_int(n) + ")\n")
    val _ = if n != i then
      (exit(1) ; ())
    else
      ()
  }

// TODO: allow to run action on failure?
implement iterate_list (t, i, n) =
  let
    val _ = if i = 0 then
      println!(t.group + ":")
    else
      ()
    
    fun handle_loop(s : string, b : lazy(bool), xs : test_tree) : void =
      if !b then
        (println!("  \33[32msucceeded:\33[0m " + s) ; iterate_list(xs, i + 1, n))
      else
        (println!("  \33[31mfailed:\33[0m " + s) ; iterate_list(xs, i, n))
  in
    case+ t.leaves of
      | ~list_vt_nil() => fail_incomplete(i, n)
      | ~list_vt_cons (x, xs) => handle_loop( x.test_name
                                            , x.test_result
                                            , @{ group = t.group, leaves = xs }
                                            )
  end
