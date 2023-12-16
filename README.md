# Typst Template
Some basic Typst templates created for myself to use for academic projects/assignments. Makefile is used for ease of compilation. 

## What is Typst?
Typst is a newly created typesetting language which combines the ease of Markdown with the breadth of LaTeX. As anyone who's used LaTeX knows, it is wildly complex even for the most simple of tasks. Typst aims to solve this problem while also including many very powerful features.

### Example of the Power of Typst
Using this markup:
```typst
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
```
The following can be generated:

## How to use?
Clone the repo:
```bash
git clone URL my-project
```

Change directory:
```bash
cd my-project
```

Run make to compile the Typst file in `src` to the `build` directory
```
make
```
> Use `make watch` to watch for file changes in the source file and re-compile
