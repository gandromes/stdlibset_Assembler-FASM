#include "c_lib/fmt.h"
#include "c_lib/str.h"
#include "c_lib/sys.h"

typedef unsigned long long int _uint64_t;
typedef unsigned char _uint8_t;

#define SIZE 100

int main(void)
{
  _uint8_t* data = "#include <stdio.h>\n\nint main(void)\n{\n\tprintf(\"Hello world!\\n\");\n}";
  _uint64_t data_size = c_length_string(data);
  _uint8_t* filename = "xxx.c";

  _uint64_t descriptor = c_fcreate(filename, 0666);
  c_fwrite(descriptor, data, data_size);
  c_fclose(descriptor);

  static _uint8_t buffer[SIZE];
  _uint64_t descript = c_fopen(filename, 0);
  c_fread(descript, buffer, SIZE);
  c_print_f("%s\n", buffer);

  c_fdelete(filename);
  c_exit();
}
