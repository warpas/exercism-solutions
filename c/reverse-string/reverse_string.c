#include "reverse_string.h"
#include <stdio.h>

char *reverse(const char *value)
{
  printf("%s\n", value);
  char* reversed[100] = {""};
  reversed[0] = "O";
  reversed[1] = "\0";

  return *reversed;
}
