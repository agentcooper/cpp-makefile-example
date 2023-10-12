#include "A.hpp"
#include "B.hpp"

#include <iostream>

int main() {
  A a;
  B b;
  std::cout << a.getValue() << b.getValue() << std::endl;
}