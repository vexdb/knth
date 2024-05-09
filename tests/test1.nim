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
  check knth.knth_n_quickselect[int](x, 1) == 0

test "k-nth quickselect assert exception when k == length":
  var x = @[0]

  expect (IndexError):
    var r = knth.knth_n_quickselect[int](x, 2)

test "k-nth quickselect simple case - 2 elements":
  var x = @[0, 1, 2]
  check knth.knth_n_quickselect[int](x, 1) == 0
  check knth.knth_n_quickselect[int](x, 2) == 1
  check knth.knth_n_quickselect[int](x, 3) == 2

test "k-nth quickselect 5 numbers":
  var x = @[1, 2, 3, 4, 5]
  check knth.knth_n_quickselect[int](x, (x.len/2).toInt) == 3


test "k-nth nk simple case":
  var x = @[0]
  check knth.knth_nk[int](x, 1) == 0

test "k-nth nk assert exception when k == length":
  var x = @[0]

  expect (IndexError):
    var r = knth.knth_nk[int](x, 2)

test "k-nth nk simple case - 2 elements":
  var x = @[0, 1, 2]
  check knth.knth_nk[int](x, 1) == 0
  check knth.knth_nk[int](x, 2) == 1
  check knth.knth_nk[int](x, 3) == 2

test "k-nth nk 5 numbers":
  var x = @[1, 2, 3, 4, 5]
  check knth.knth_nk[int](x, (x.len/2).toInt) == 3

test "k-nth nk 5 many numbers":
  var x = @[8, 7, 1, 2, 4, 5, 3, 9, 11, -200, 12]
  check knth.knth_nk[int](x, 1) == -200
  check knth.knth_nk[int](x, 2) == 1
