typedef unsigned long long int _uint64_t;
typedef unsigned char _uint8_t;

extern void c_number_to_string(_uint64_t number, _uint8_t* buffer, _uint64_t buffer_size);
extern _uint64_t c_string_to_number(_uint8_t* str);
extern _uint64_t c_length_string(_uint8_t* str);
