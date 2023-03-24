typedef unsigned long long int _uint64_t;
typedef unsigned char _uint8_t;

extern void c_print_char(_uint8_t ch);
extern void c_print_string(_uint8_t* str);
extern void c_print_bin(_uint64_t number);
extern void c_print_oct(_uint64_t number);
extern void c_print_number(_uint64_t number);
extern void c_print_hex(_uint64_t number);
extern void c_print_empty_line(void);
extern void c_print_bytes(_uint8_t* str, _uint64_t size);
extern void c_print_f(_uint8_t* str, ...);
