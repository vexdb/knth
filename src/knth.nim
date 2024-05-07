import std/times
import std/random
import std/strformat

proc iknth_n_quickselect[T](a: var openArray[T], length: int, k: int): T =
    var i: int
    var c = 0
    var pivot: T
    var left_size: int

    c = rand(length - 1)
    pivot = a[c]

    swap a[c], a[length - 1]

    left_size = 0

    for i in 0 ..< length - 1:
      if a[i] < pivot:
        swap a[i], a[left_size]
        left_size += 1

    swap a[left_size], a[length - 1]

    if k == left_size:
      return pivot

    if k < left_size:
      return iknth_n_quickselect(a, left_size, k)
    else:
      let u = left_size + 1
      let p = length - 1
      return iknth_n_quickselect(toOpenArray(a, u, p), length - left_size - 1, k - left_size - 1)

proc knth_n_quickselect*[T](a: var openArray[T], length: int, k: int): T =
  if k > length:
    raise newException(IndexError, &"k {k} is out of bounds")

  randomize()
  return iknth_n_quickselect(a, length, k - 1)