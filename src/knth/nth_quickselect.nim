import std/random

proc iknth_n_quickselect*[T](a: var openArray[T], k: int): T =
    var i: int
    var c = 0
    var pivot: T
    var left_size: int

    c = rand(a.len - 1)
    pivot = a[c]

    swap a[c], a[a.len - 1]

    left_size = 0

    for i in 0 ..< a.len - 1:
      if a[i] < pivot:
        swap a[i], a[left_size]
        left_size += 1

    swap a[left_size], a[a.len - 1]

    if k == left_size:
      return pivot

    if k < left_size:
      return iknth_n_quickselect(toOpenArray(a, 0, left_size), k)
    else:
      let u = left_size + 1
      let p = a.len - 1
      return iknth_n_quickselect(toOpenArray(a, u, p), k - left_size - 1)
