#include "B.hpp"
#include "C.hpp"

std::string B::getValue() {
  C c;
  return " world, " + c.getValue() + "!";
}