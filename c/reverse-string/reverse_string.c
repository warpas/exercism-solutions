#include "reverse_string.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *internet_strdup(const char *s);

char *reverse(const char *value)
{
  printf("Input: %s\n", value);
  int length = strlen(value);
  printf("Length: %d\n", length);
  char* reversed[100] = {""};
  reversed[0] = "O";
  reversed[1] = "\0";
  if(length == 0)
  {
    char* default_value = internet_strdup(value);
    return default_value;
  }

  return *reversed;
}

char *internet_strdup(const char *s)
{
    size_t size = strlen(s) + 1;
    char *p = malloc(size);
    if (p != NULL) {
        memcpy(p, s, size);
    }
    return p;
}
