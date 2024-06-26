import std/random
import std/strformat

import knth/nth_quickselect
import knth/nth_nk
import knth/nth_mom

proc knth_n_quickselect*[T](a: var openArray[T], k: int): T =
  if k > a.len:
    raise newException(ValueError, &"k {k} is out of bounds")

  randomize()
  return iknth_n_quickselect(a, k - 1)

proc knth_nk*[T](a: var openArray[T], k: int): T =
  if k > a.len:
    raise newException(ValueError, &"k {k} is out of bounds")

  return iknth_nk(a, k)

proc knth_quickselect_mom*[T](a: var openArray[T], k: int): T =
  if k > a.len:
    raise newException(ValueError, &"k {k} is out of bounds")

  return iknth_select(a, k - 1)