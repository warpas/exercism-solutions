#include "armstrong_numbers.h"

int calculate_armstrong_from(int raw_number);

int calculate_armstrong_from(int raw_number)
{
  int all_digits[100] = {0};
  int armstrong_sum = 0;
  int digits_count;
  int leftover_number = raw_number;
  for(digits_count = 0; leftover_number > 0; digits_count++)
  {
    all_digits[digits_count] = leftover_number % 10;
    leftover_number = leftover_number / 10;
  }
  for(int j = 0; j < digits_count; j++)
  {
    int multiplication_result = 1;
    for(int i = 0; i < digits_count; i++)
    {
      multiplication_result *= all_digits[j];
    }
    armstrong_sum += multiplication_result;
  }
  return armstrong_sum;
}

bool is_armstrong_number(int candidate)
{
  int armstrong_number = calculate_armstrong_from(candidate);
  return candidate == armstrong_number;
}
