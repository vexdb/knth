# K-nth element

The K-nth element (or just nth element) problem is the problem of finding the K smallest number in a specified array. It can be used to find the median in an array. The reason for this package is that the most common strategy to obtain an array's median is to sort it (usually O(n logn)) and then use an O(1) operation to return the number. There are O(n) strategies (on average) that could provide better performance if you need to repeat this median operation all the time.

If you are looking for some academic material on this problem I would recommend reading:

* [Algorithm Design and Analysis](https://www.cs.cmu.edu/~15451-s24/notes.pdf)

## Implementations

You will find: 

 * [Quickselect with random pivot](https://en.wikipedia.org/wiki/Quickselect) implementation which is O(n) on average

## API

Simply pass an `openArray` compatible object and the `k` value to this package functions:

```nim
var x = @[8, 7, 1, 2, 4, 5, 3, 9, 11, -200, 12]
check knth.knth_n_quickselect[int](x, 1) == -200
check knth.knth_n_quickselect[int](x, 2) == 1
```