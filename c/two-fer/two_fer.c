#include "two_fer.h"
#include <stdio.h>
#include <string.h>

void two_fer(char *buffer, const char *name)
{
  printf("buffer: %s\n", buffer);
  printf("name: %s\n", name);
  char* msg_start = "One for ";
  int msg_start_length = strlen(msg_start);
  char* default_name = "you";
  char* msg_end = ", one for me.";
  int msg_end_length = strlen(msg_end);

  if(name == NULL)
  {
    name = default_name;
  }
  printf("name: %s\n", name);
  int name_length = strlen(name);

  int i = 0;
  for(; i < msg_start_length; i++)
  {
    buffer[i] = msg_start[i];
  }
  for(int j = 0; j < name_length; j++)
  {
    buffer[i] = name[j];
    i++;
  }
  for(int k = 0; k < msg_end_length; k++)
  {
    buffer[i] = msg_end[k];
    i++;
  }
}
