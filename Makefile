perf_test: build golang_perf_test clang_perf_test python_perf_test java_perf_test java_perf_test_preallocate

build: golang_build clang_build java_build

clean:
	rm ./c_main
	rm ./go_main
	rm ./main.class

golang_build: main.go
	go build -ldflags="-s -w" -o go_main ./main.go

golang_perf_test: golang_build
	@echo "----------"
	@echo "Golang:"
	time ./go_main
	@echo "----------"

clang_build: main.c
	clang -Ofast ./main.c -o c_main

clang_perf_test: clang_build
	@echo "----------"
	@echo "Clang:"
	time ./c_main
	@echo "----------"

java_build: main.java
	javac ./main.java

java_perf_test_preallocate: java_build
	@echo "----------"
	@echo "Java (w/Large Preallocated Heap):"
	time java -Djava.compiler=NONE -Xms8g main
	@echo "----------"

java_perf_test: java_build
	@echo "----------"
	@echo "Java (w/Regular Heap):"
	time java -Djava.compiler=NONE main
	@echo "----------"

python_perf_test:
	@echo "----------"
	@echo "Python 2"
	time python ./main.py
	@echo "----------"
