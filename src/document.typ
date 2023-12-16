#import "../templates/assignment.typ": conf

#show: doc => conf(
  title: [Assignment 1],
  class: [TYPST 101],
  studentID: [12345678],
  author: [Ammar Ahmed],
  titleInfo: (
    "Due Date": "March 22nd, 2001",
    "Professor": "Dick McDickerson",
    "Collaborators": "John Wick, Bruce Wayne"
  ),
  titleLogo: [#image("./resources/images/waterloo.png", width: 100%)],
  pageNumbering: "1 / 1",
  sectionNumbering: "1.1.1",
  doc
)



= Factorial 
The factorial of a number, $n$, is expressed as $n!$. It is mathematically defined through recurrence, where, $n! = n times (n - 1)!$. So, for $n = 5$:
$ 
  5! &= 5 times (5 - 1)! \
  &= 5 times 4! \
  4! &= 4 times (4 - 1)!\
  &= 4 times 3! \
  3! &= 3 times (3 - 1)!\
  &= 3 times 2!\
  2! &= 2 times (2 - 1)!\
  &= 2 times 1! = 2 times 1 = 2\   
$

Thus,
$ 
  3! &= 3 times 2! = 3 times 2 times 1 \
  4! &= 4 times 3! = 4 times 3 times 2 times 1 \
  5! &= 5 times 4! = 5 times 4 times 3 times 1 \
  &= 120
$
#let count = 10
#let nums = range(1, count + 1)
#let factorial(n) = {
  if n <= 1 { 1 }
  else {
    let result = 1
    for i in range(2, n + 1){
      result = result * i
    }
    result
   }
}

The factorial of the first #count integers is:
#align(center, 
  table(
    columns: count,
    ..nums.map(n => [*$#n!$*]),
    ..nums.map(n => str(factorial(n)))
  )
)

= Arithmetic Sequence 
#let N = 5
#let d = 6
#let a1 = 3
#let a_seq(a1, N, d) = {
  let n = 0
  let result = ()
  while n < N {
    n = n + 1
    result.push(a1 + (n - 1) * d)
  }
  result
}

#let str_sum(seq) = {
  let i = 0
  let N = seq.len()
  let result = ""
  while (i < N) {
    result = result + str(seq.at(i))
    if i < N - 1 { result = result + " + "}
    i = i + 1
  }
  result
}

#let str_seq(seq) = {
  let i = 0
  let N = seq.len()
  let result = "["
  while (i < N) {
    result = result + str(seq.at(i))
    if i < N - 1 { result = result + ", " }
    i = i + 1
  }
  result = result + "]"
  result
}

#let sum_seq(seq) = {
  let tot = 0
  for val in seq {
    tot = tot + val
  }
  tot
}
#let sequence = a_seq(a1, N, d)
An arithmetic sequence is defined as a set of numbers that have a common difference between each consecutive term. For example, the sequence, #str_seq(sequence), is an arithmetic sequence starting at #a1 with #N terms separated by the common difference of #d. 

Mathematically, it is defined by:
$ a_n = a_1 + (n - 1)d $

== Sum of Arithmetic Sequence 
The sum of an arithmetic sequence:
$ S_N = sum_(n=1)^N a_n $
can be calculated simply with:
$ S_N = N / 2 (2a_1 + (N - 1)d) $
For the given sequence, #str_seq(sequence):
$ S_N = sum_(n=1)^N a_n &= #str_sum(sequence) \ &= #str(sum_seq(sequence)) $

Using the formula, 
$
  S_N &= N / 2 (2a_1 + (N - 1)d) \
  &= #N / 2 (2(#a1) + (#N - 1)#d) \ 
  &= 75 \
$