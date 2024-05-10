import std/math

import nth_nk

proc simple_median*[T](a: var openArray[T]): T =
  let middle = T(a.len / 2)
  var result = newSeq[T](a.len)

  if a.len == 0:
    return a[0]

  for i in 0..<a.len:
    result[i] = 0
    for j in 0..<a.len:
      if a[i] < a[j]:
        result[i] += 1

  for i in 0..<a.len:
    if result[i] == middle:
      return a[i]

  return a[0]

proc iknth_select*[T](a: var openArray[T], k: int): T =
  var c = 0
  var mom: T
  var left_size: int
  var group_number = T(a.len / 5)

  var medians = newSeq[T](group_number)

  if a.len <= 5:
    return nth_nk.iknth_nk(a, k + 1)

  for i in 0..<group_number:
    medians[i] = simple_median(toOpenArray(a, i*5, clamp((i*5)+5, 0 .. a.len)))

  mom = iknth_select(medians, int(group_number / 2))

  for i in 0..<a.len:
    if a[i] == mom:
      c = i
      break

  swap(a[c], a[a.len - 1])

  left_size = 0

  for i in 0..<a.len - 1:
    if a[i] < mom:
      swap(a[i], a[left_size])
      left_size += 1

  swap(a[left_size], a[a.len - 1])

  if k == left_size:
    return mom

  if k < left_size:
    return iknth_select(toOpenArray(a, 0, left_size - 1), k)
  else:
    return iknth_select(toOpenArray(a, left_size+1, a.len - 1), k - left_size - 1)