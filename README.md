# Typst Template
Some basic Typst templates created for myself to use for academic projects/assignments. Makefile is used for ease of compilation. 

## What is Typst?
Typst is a newly created typesetting language which combines the ease of Markdown with the breadth of LaTeX. As anyone who's used LaTeX knows, it is wildly complex even for the most simple of tasks. Typst aims to solve this problem while also including many very powerful features.

### Example of the Power of Typst
Using this markup:
```typst

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
