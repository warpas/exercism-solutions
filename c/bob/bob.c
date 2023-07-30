#include "bob.h"
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

bool is_shouting(char *greeting);
bool is_question(char *greeting);
bool is_silence(char *greeting);
char *strip_string(char *greeting);
char *internet_rtrim(char *s);
char *internet_strdup(const char *s);

char *hey_bob(char *greeting)
{
  char* default_reply = "Whatever.";
  char* shouting_reply = "Whoa, chill out!";
  char* question_reply = "Sure.";
  char* shouting_question_reply = "Calm down, I know what I'm doing!";
  char* silence_reply = "Fine. Be that way!";

  char* trimmed_greeting = strip_string(greeting);

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

bool is_shouting(char *greeting)
{
  bool all_uppercase = true;
  bool all_lowercase = true;

  for(int i = 0; greeting[i]; i++)
  {
    if(all_uppercase)
    {
      bool is_the_next_character_uppercase = greeting[i] == toupper(greeting[i]);
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

bool is_question(char *greeting)
{
  char last_character = greeting[strlen(greeting)-1];

  return last_character == '?';
}

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

  char* left_trimmed_copy = internet_strdup(*string_copy);
  return internet_rtrim(left_trimmed_copy);
}

char *internet_rtrim(char *s)
{
    char* back = s + strlen(s);
    while(isspace(*--back));
    *(back+1) = '\0';
    return s;
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
