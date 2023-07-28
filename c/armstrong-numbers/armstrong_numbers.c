#include "armstrong_numbers.h"
#include <stdio.h>

int calculate_armstrong_from(int raw_number);

int calculate_armstrong_from(int raw_number)
{
  int remainder = raw_number;
  int sum = 0;
  int digits_count = 0;
  int i = 0;
  int all_digits[10] = {0};
  int armstrong_sum = 0;
  printf("\nBuilding the next example for %d\n", raw_number);
  for(i = 0; remainder > 0; i++)
  {
    int last_digit = remainder % 10;
    int division_result = remainder / 10;
    printf("line %d, remainder before: %d, after: %d\n", i+1, remainder, division_result);
    remainder = division_result;
    sum += last_digit;
    all_digits[i] = last_digit;
    digits_count++;
  }
  printf("digits_count is %d, i is %d\n", digits_count, i);
  printf("sum is %d\n", sum);
  for(int j = 0; j < digits_count; j++)
  {
    int multiplication_result = 1;
    for(int k = 0; k < digits_count; k++)
    {
      multiplication_result *= all_digits[j];
    }
    armstrong_sum += multiplication_result;
  }
  printf("armstrong_sum is %d\n", armstrong_sum);
  return armstrong_sum;
}

bool is_armstrong_number(int candidate)
{
  int armstrong_number = calculate_armstrong_from(candidate);
  return candidate == armstrong_number;
}
