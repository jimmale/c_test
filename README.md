# C_test

A quick project to check out the differences in speed when working with strings.

The idea here was to test how well each language fares when many strings are created for a very
short period of time, and then become garbage.

My initial suspicion was that Java wouldn't do very well under these circumstances
due to Strings being immutable; and that C would do very well if I just blanked the same
character array instead of making a "new" string. I figured Golang would be somewhere in the middle.


## Requirements
- Go
- clang / llvm
- Java
- Python

## Building/Running
| Command | Action |
| ------- | ------ |
| `make`    | compile and run all tests |
| `make build` | compile all tests |
| `make clean` | delete compile artifacts |
| `make perf_test` | run all tests |
| `golang_build` | compile golang executable |
| `golang_perf_test` | run the golang perf test |
| `clang_build` | compile the C perf test |
| `clang_perf_test` | run the C perf test |
| `java_build` | compile the Java perf test |
| `java_perf_test` | run the Java perf test with regular heap management |
| `java_perf_test_preallocate` | run the Java perf test with a starting heap size of 8GB |
| `python_perf_test` | run the python 2 perf test |

## Results

| Language        | Peak RAM  | Time       |
| :-------------- | ---------:| ----------:|
| Golang          |    7.4 MB |  42.44 sec |
| C (clang)       |    0.3 MB | 102.81 sec |
| Python 2        | 3040.0 MB |  25.16 sec |
| Java Regular    |  167.4 MB |  60.45 sec |
| Java Large Heap | 4080.0 MB |  65.50 sec |



Overall, this isn't far off from what I expected, but there were a few surprises...

I was very surprised that C was the slowest out of all of them. I'm willing to
chalk that up to not being the world's best C developer. Pull requests welcome :)

I was also surprised that giving Java more memory made it measurably slower.

Curiously, Python was the fastest out of all of these, being twice as fast as
Golang, but seemingly at the expense of RAM usage. Replacing the one line in the
for loop in the Python script with `pass` shows similar memory hogging behavior,
so I think this might be related to the loop structure rather than creating all
the strings.
