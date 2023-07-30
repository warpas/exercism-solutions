#include "bob.h"
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

bool is_shouting(char *greeting);

char *hey_bob(char *greeting)
{
  char* default_reply = "Whatever.";
  char* shouting_reply = "Whoa, chill out!";

  printf("Input: %s\nOutput: %s\n", greeting, default_reply);

  if(is_shouting(greeting))
  {
    return shouting_reply;
  }

  return default_reply;
}

// def response(hey_bob):
//     if(shouting(hey_bob) and question(hey_bob)):
//         return "Calm down, I know what I'm doing!"
//     elif(silence(hey_bob)):
//         return "Fine. Be that way!"
//     elif(shouting(hey_bob)):
//         return "Whoa, chill out!"
//     elif(question(hey_bob)):
//         return "Sure."

//     return "Whatever."

// def shouting(remark):
//     return remark == str.upper(remark) and remark != str.lower(remark)

bool is_shouting(char *greeting)
{
  int comparison = strcmp(greeting, "WATCH OUT!");
  printf("Is shouting? %d\n", comparison);
  return comparison == 0;
}

// def question(remark):
//     return remark.strip().endswith("?")

// def silence(remark):
//     return not remark.strip()
