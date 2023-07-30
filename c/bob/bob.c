#include "bob.h"
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

bool is_shouting(char *greeting);
bool is_question(char *greeting);
bool is_silence(char *greeting);
char *strip_string(char *greeting);
char *rtrim(char *s);

char *hey_bob(char *greeting)
{
  char* default_reply = "Whatever.";
  char* shouting_reply = "Whoa, chill out!";
  char* question_reply = "Sure.";
  char* shouting_question_reply = "Calm down, I know what I'm doing!";
  char* silence_reply = "Fine. Be that way!";

  printf("Input: %s<\n", greeting);
  char* trimmed_greeting = strip_string(greeting);
  printf("Trim Input: %s<\n", trimmed_greeting);

  if (is_shouting(trimmed_greeting) && is_question(trimmed_greeting))
  {
    return shouting_question_reply;
  }
  else if(is_shouting(trimmed_greeting))
  {
    return shouting_reply;
  }
  else if(is_silence(trimmed_greeting))
  {
    return silence_reply;
  }
  else if (is_question(trimmed_greeting))
  {
    return question_reply;
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
  // int comparison = strcmp(greeting, "WATCH OUT!");
  // printf("Is shouting? %d\n", comparison);
  // return comparison == 0;
  bool all_uppercase = true;
  bool all_lowercase = true;

  for(int i = 0; greeting[i]; i++)
  {
    // printf("regular char: %c\n", greeting[i]);
    // printf("lowercase char: %c\n", tolower(greeting[i]));
    // printf("upprecase char: %c\n", toupper(greeting[i]));
    if(all_uppercase)
    {
      bool is_the_next_character_uppercase = greeting[i] == toupper(greeting[i]);
      // printf("is upper? %d\n", is_the_next_character_uppercase);
      all_uppercase = is_the_next_character_uppercase;
    }
    if(all_lowercase)
    {
      bool is_the_next_character_lowercase = greeting[i] == tolower(greeting[i]);
      all_lowercase = is_the_next_character_lowercase;
    }
  }
  return all_uppercase && !all_lowercase;
}

// def question(remark):
//     return remark.strip().endswith("?")

bool is_question(char *greeting)
{
  char last_character = greeting[strlen(greeting)-1];

  return last_character == '?';
}

// def silence(remark):
//     return not remark.strip()

bool is_silence(char *greeting)
{
  int comparison = strcmp(greeting, "");
  return comparison == 0;
}

char *strip_string(char *string_input)
{
  char* string_copy[256] = {""};
  string_copy[0] = "";
  int j = 0;
  for(int i = 0; string_input[i]; i++)
  {
    if(!isspace(string_input[i]))
    {
      string_copy[j] = &string_input[i];
      j++;
    }
  }

  char* left_trimmed_copy = strdup(*string_copy);
  return rtrim(left_trimmed_copy);
}

char *rtrim(char *s)
{
    char* back = s + strlen(s);
    while(isspace(*--back));
    *(back+1) = '\0';
    return s;
}
