#include "reverse_string.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *reverse(const char *value)
{
  int tab[100] = {0};

  printf("Input: %s\n", value);
  int length = strlen(value);
  printf("Length: %d\n", length);
  printf("Tab[0]: %d\n", tab[0]);
  char revved[100] = {0};
  int i = 0;

  for(; i < length; i++)
  {
    int char_code = (int)value[i];
    tab[i] = (int)value[length-i-1];
    printf("value[%d]: %c %d %d, tab[i] = %d\n", i, value[i], value[i], char_code, tab[i]);
  }
  printf("i: %d\n", i);
  int j=0;
  for(; j < length; j++)
  {
    printf("Js tab: %d\n", tab[j]);
    revved[j] = (char)tab[j];
    printf("Js revved: %c\n", revved[j]);
  }
  revved[j] = '\0';
//   char* whole_string = revved;
//   printf("Are we done? Whole: %s\n", whole_string);

  char* whole_string = malloc(length + 1);

  if(whole_string == NULL)
  {
    return NULL;
  }
  strcpy(whole_string, revved);

  if(length == 0)
  {
    char* default_value = malloc(length + 1);
    strcpy(default_value, "");
    return default_value;
  }

  return whole_string;
}
