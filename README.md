Example Makefile for a C++ project with incremental compilation and automatic resolution of dependencies (header files).

## Demo

Initial compilation:

```bash
% make
g++ -Wall -std=c++20 -MMD -c src/A.cpp -o build/A.o
g++ -Wall -std=c++20 -MMD -c src/B.cpp -o build/B.o
g++ -Wall -std=c++20 -MMD -c src/main.cpp -o build/main.o
g++ -Wall -std=c++20 -MMD -o main build/A.o build/B.o build/main.o
```

Edit header dependency:

```bash
sed -i '' 's/John/Jane/' src/C.hpp
```

Only B module is rebuilt on recompilation: 

```bash
% make                            
g++ -Wall -std=c++20 -MMD -c src/B.cpp -o build/B.o
g++ -Wall -std=c++20 -MMD -o main build/A.o build/B.o build/main.o
```