# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import knth

test "k-nth quickselect simple case":
  var x = @[0]
  check knth.knth_n_quickselect[int](x, 1, 1) == 0

test "k-nth quickselect assert exception when k == length":
  var x = @[0]

  expect (IndexError):
    var r = knth.knth_n_quickselect[int](x, 1, 2)

test "k-nth quickselect simple case - 2 elements":
  var x = @[0, 1, 2]
  check knth.knth_n_quickselect[int](x, 3, 1) == 0
  check knth.knth_n_quickselect[int](x, 3, 2) == 1
  check knth.knth_n_quickselect[int](x, 3, 3) == 2

test "k-nth quickselect 5 numbers":
  var x = @[1, 2, 3, 4, 5]
  check knth.knth_n_quickselect[int](x, x.len, (x.len/2).toInt) == 3