#include "armstrong_numbers.h"
#include <stdio.h>

int calculate_armstrong_from(int raw_number)
{
  int remainder = raw_number;
  int sum = 0;
  int digits_count = 0;
  int i = 0;
  // printf("%d\n", remainder);
  // int armstrong_sum = 0;
  printf("\nBuilding the next example for %d\n", raw_number);
  for(i = 0; remainder>0; i++)
  {
    int last_digit = remainder % 10;
    int division_result = remainder / 10;
    printf("line %d, remainder before: %d, after: %d\n", i+1, remainder, division_result);
    remainder = division_result;
    sum += last_digit;
    digits_count++;
  }
  printf("digits_count is %d, i is %d\n", digits_count, i);
  printf("sum is %d\n", sum);
  return sum;
}

bool is_armstrong_number(int candidate)
{
  int armstrong_number = calculate_armstrong_from(candidate);
  return candidate == armstrong_number;
}
