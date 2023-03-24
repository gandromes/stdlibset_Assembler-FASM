#include "c_lib/fmt.h"
#include "c_lib/sys.h"
#include "c_lib/mth.h"
#include "c_lib/srt.h"
#include "c_lib/str.h"

typedef unsigned long long int _uint64_t;
typedef unsigned char _uint8_t;

#define SIZE 120
#define LENGTH(arr) sizeof(arr) / sizeof(arr[0])

int main(void)
{
  // _uint64_t a = c_input_number();
  // a *= 2;
  // c_print_number(a);
  // c_print_empty_line();
  //
  // _uint64_t time_now = c_time_now();
  // c_srand(time_now);
  // c_print_number(c_rand());
  // c_print_empty_line();
  //
  // c_print_f("[%d]\n", c_gcd(3712, 1234));
  // c_print_f("[%d]\n", c_factorial(5));

  // c_print_string("Take number to calc Fibonacci: ");
  // _uint64_t n = c_input_number();
  // c_print_f("[%d]\n", c_fibonacci(n));

  // _uint8_t arrayNumber[7] = {1, 3, 0, 92, 123, 22, 11};
  // c_print_bytes(arrayNumber, LENGTH(arrayNumber));
  // c_bubble_sort(arrayNumber, LENGTH(arrayNumber));
  // c_print_empty_line();
  // c_print_bytes(arrayNumber, LENGTH(arrayNumber));
  // c_print_empty_line();

  // char* str = "Hello, world!";
  // c_print_number(c_length_string(str));
  // c_print_empty_line();

  // char* strNUM = "567";
  // int NUM = c_string_to_number(strNUM);
  // c_print_f("%d + %d = %d\n", NUM, NUM, NUM + NUM);

  // int num = 567;
  // static _uint8_t STR[4];
  // c_number_to_string(num, STR, 4);
  // c_print_f("string -> %s\n", STR);

  char* past = "#include <stdio.h>\n\nint main(void)\n{\n\tprintf(\"Hello world!\\n\");\n}";
  _uint64_t descriptor = c_fcreate("xxx.c", 0666);
  c_fwrite(descriptor, past, c_length_string(past));
  c_fclose(descriptor);

  // char* hi = "Hello, world";
  // _uint64_t descriptor = c_fopen("xxx.c", 1);
  // c_fwrite(descriptor, hi, c_length_string(hi));
  // c_fclose(descriptor);

  // static _uint8_t buffer[SIZE];
  // _uint64_t descriptor = c_fopen("xxx.c", 0);
  // c_fread(descriptor, buffer, SIZE);
  // c_print_f("%s\n", buffer);

  // c_fdelete("xxx.c");

  return 0;
}
