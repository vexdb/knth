proc iknth_nk*[T](a: openArray[T], length: int, k: int): T =
  var aux: seq[T] = newSeq[T](length + 1)
  var min = low(T)
  var number: T
  var current_min_index = -1
    
  for i, x in aux:
    aux[i] = T(0)

  for i in 0 ..< k:
    min = high(T)

    for j in i ..< length:
      number = a[j]

      if aux[j] == 0 and number < min:
        min = number
        current_min_index = j

    aux[current_min_index] = min
  
  return min