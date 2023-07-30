#include "two_fer.h"
#include <stdio.h>

void two_fer(char *buffer, const char *name)
{
  printf("buffer: %s\nname: %s\n", buffer, name);
  // buffer = "One for you, one for me.";

  // for(int i=0; )
  buffer[0] = 'O';
  buffer[1] = 'n';
  buffer[2] = 'e';
  buffer[3] = ' ';
  buffer[4] = 'f';
  buffer[5] = 'o';
  buffer[6] = 'r';
  buffer[7] = ' ';
  buffer[8] = 'y';
  buffer[9] = 'o';
  buffer[10] = 'u';
  buffer[11] = ',';
  buffer[12] = ' ';
  buffer[13] = 'o';
  buffer[14] = 'n';
  buffer[15] = 'e';
  buffer[16] = ' ';
  buffer[17] = 'f';
  buffer[18] = 'o';
  buffer[19] = 'r';
  buffer[20] = ' ';
  buffer[21] = 'm';
  buffer[22] = 'e';
  buffer[23] = '.';
}
