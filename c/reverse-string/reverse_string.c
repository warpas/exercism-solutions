#include "reverse_string.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *reverse(const char *value)
{
  int tab[100] = {0};
  int length = strlen(value);

  if(length == 0)
  {
    char* default_value = malloc(length + 1);
    strcpy(default_value, "");
    return default_value;
  }

  char reversed_string[100] = {0};
  int i = 0;

  for(; i < length; i++)
  {
    tab[i] = (int)value[length-i-1];
  }
  int j=0;
  for(; j < length; j++)
  {
    reversed_string[j] = (char)tab[j];
  }
  reversed_string[j] = '\0';

  char* whole_string = malloc(length + 1);
  strcpy(whole_string, reversed_string);
  return whole_string;
}
