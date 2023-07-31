#include "reverse_string.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *reverse(const char *value)
{
  int length = strlen(value);
  char* reversed_string = malloc(length + 1);

  if(length == 0)
  {
    strcpy(reversed_string, "");
    return reversed_string;
  }

  int i = 0;
  for(; i < length; i++)
    reversed_string[i] = (char)value[length-i-1];
  reversed_string[i] = '\0';

  return reversed_string;
}
