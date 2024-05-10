proc iknth_nk*[T](a: openArray[T], k: int): T =
  var aux: seq[bool] = newSeq[bool](a.len)
  var min = low(T)
  var number: T
  var current_min_index = -1

  if a.len == 0:
    return a[0]
    
  for i, x in aux:
    aux[i] = false

  for i in 0 ..< k:
    min = high(T)

    for j in 0 ..< a.len:
      number = a[j]

      if not aux[j] and number < min:
        min = number
        current_min_index = j

    aux[current_min_index] = true
  
  return min