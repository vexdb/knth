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

  expect (ValueError):
    var r = knth.knth_n_quickselect[int](x, 2)

test "k-nth quickselect simple case - 2 elements":
  var x = @[0, 1, 2]
  check knth.knth_n_quickselect[int](x, 1) == 0
  check knth.knth_n_quickselect[int](x, 2) == 1
  check knth.knth_n_quickselect[int](x, 3) == 2

test "k-nth quickselect 5 numbers":
  var x = @[1, 2, 3, 4, 5]
  check knth.knth_n_quickselect[int](x, (x.len/2).toInt) == 3

test "k-nth quickselect in many numbers":
  var x = @[8, 7, 1, 2, 4, 5, 3, 9, 11, -200, 12]
  check knth.knth_n_quickselect[int](x, 1) == -200
  check knth.knth_n_quickselect[int](x, 2) == 1

test "k-nth nk simple case":
  var x = @[0]
  check knth.knth_nk[int](x, 1) == 0

test "k-nth nk assert exception when k == length":
  var x = @[0]

  expect (ValueError):
    var r = knth.knth_nk[int](x, 2)

test "k-nth nk simple case - 2 elements":
  var x = @[0, 101, 102]
  check knth.knth_nk[int](x, 1) == 0
  check knth.knth_nk[int](x, 2) == 101
  check knth.knth_nk[int](x, 3) == 102

test "k-nth nk 5 numbers":
  var x = @[5, 3, 1, 2, 4]

  check knth.knth_quickselect_mom[int](x, 1) == 1
  check knth.knth_quickselect_mom[int](x, 2) == 2
  check knth.knth_quickselect_mom[int](x, 3) == 3
  check knth.knth_quickselect_mom[int](x, 4) == 4
  check knth.knth_quickselect_mom[int](x, 5) == 5

test "k-nth nk in many numbers":
  var x = @[8, 7, 1, 2, 4, 5, 3, 9, 11, -200, 12]
  check knth.knth_nk[int](x, 1) == -200
  check knth.knth_nk[int](x, 2) == 1

test "k-nth quickselect+mom simple case - rely on knth_nk":
  var x = @[0]
  check knth.knth_quickselect_mom[int](x, 1) == 0

test "k-nth quickselect up to 5 elements - rely on knth_nk":
  var x = @[5, 3, 1, 2, 4]
  check knth.knth_quickselect_mom[int](x, 1) == 1
  check knth.knth_quickselect_mom[int](x, 2) == 2
  check knth.knth_quickselect_mom[int](x, 3) == 3
  check knth.knth_quickselect_mom[int](x, 4) == 4
  check knth.knth_quickselect_mom[int](x, 5) == 5

test "k-nth quickselect_mom with 6 elements":
  var x = @[5, 3, 1, 2, 4, 6]
  check knth.knth_quickselect_mom[int](x, 1) == 1
  check knth.knth_quickselect_mom[int](x, 2) == 2
  check knth.knth_quickselect_mom[int](x, 3) == 3
  check knth.knth_quickselect_mom[int](x, 4) == 4
  check knth.knth_quickselect_mom[int](x, 5) == 5
  check knth.knth_quickselect_mom[int](x, 6) == 6

test "k-nth quickselect_mom with more than 6 elements":
  var x = @[8, 7, 1, 2, 4, 0, 3, 9, 11, -200, 12]
  check knth.knth_quickselect_mom[int](x, 1) == -200
  check knth.knth_quickselect_mom[int](x, 2) == 0
  check knth.knth_quickselect_mom[int](x, 3) == 1
  check knth.knth_quickselect_mom[int](x, 4) == 2
  check knth.knth_quickselect_mom[int](x, 5) == 3
  check knth.knth_quickselect_mom[int](x, 6) == 4
  check knth.knth_quickselect_mom[int](x, 7) == 7
  check knth.knth_quickselect_mom[int](x, 8) == 8
  check knth.knth_quickselect_mom[int](x, 9) == 9
  check knth.knth_quickselect_mom[int](x, 10) == 11
  check knth.knth_quickselect_mom[int](x, 11) == 12