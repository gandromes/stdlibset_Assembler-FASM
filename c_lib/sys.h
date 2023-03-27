typedef unsigned long long int _uint64_t;
typedef unsigned short int _uint16_t;
typedef unsigned char _uint8_t;

extern _uint64_t c_time_now(void);
<<<<<<< HEAD
extern _uint8_t* c_input_string(_uint8_t* strBuffer, _uint64_t strBuffer_size);
=======
extern _uint8_t* c_input_string(_uint8_t* str, _uint64_t size);
>>>>>>> 0fe83a83d1a12113ee5c88799832e3495f3e80bb
extern _uint64_t c_input_char(void);
extern _uint64_t c_input_number(void);
extern _uint64_t c_fcreate(_uint8_t* filename, _uint16_t permissions);
extern void c_fdelete(_uint8_t* filename);
extern _uint64_t c_fopen(_uint8_t* filename, _uint8_t mode);
extern void c_fclose(_uint64_t descriptor);
extern void c_fwrite(_uint64_t descriptor, _uint8_t* data, _uint64_t data_size);
extern void c_fread(_uint64_t descriptor, _uint8_t* buffer, _uint64_t buffer_size);
extern void c_fseek(_uint64_t descriptor, _uint8_t mode, _uint64_t position);
extern void c_exit(void);
