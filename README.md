# About the project:
- ***This project was created in order to demonstrate my skills in the Assembly(FASM) language and learn how to create libraries for high-level programming languages on it, and I also learned how to link and compile libraries. Implemented (>30) functions distributed across 5 libraries that can be used into "C" language.***

# Implement libs:

1. #inlcude "**c_lib/`fmt.h`**" - this library implements functions to output something (print_*):
    - **c_print_string** - executes length_string, puts its response in the rdx register and moves the source string to the desired rcx register.
        - code
          ```c
            char* str = "Some string.";
            c_print_string(str);
          ```
        - output
          ```java
            Some string.%
          ```
    - **c_print_char** - identical to print_string, except that initially strictly 1 byte is allocated for the length, which is located in the rdx register.
        - code
          ```c
            char ch = "S";
            c_print_char(str);
          ```
        - output
          ```java
            S%
          ```
    - **c_print_empty_line** - identical to print_char, except that we pass 0xA (newline character)to the rcx register.
        - code
          ```c
            c_print_string("newline");
            c_print_empty_line();
          ```
        - output
          ```java
            newline
            %
          ```
    - **c_print_number** - we divide the number by 10 as long as possible, add the character "0" to the remainder of the division, which means converting the number n (0-9) to the character n ("0"-"9") and put it on the stack, as soon as the original number cannot be divided, we extract n("0"-"9") from the stack, one by one and execute print_char().
        - code
          ```c
            int number = 321;
            c_print_number(number);
          ```
        - output
          ```java
            321%
          ```
    - **c_print_bin** - identical to print_number, except that we divide the original number by 2 as long as possible.
        - code
          ```c
            int number = 77;
            c_print_bin(number);
          ```
        - output
          ```java
            0b1001101%
          ```
    - **c_print_oct** - identical to print_number, except that we divide the original number by 8 as long as possible.
        - code
          ```c
            int number = 77;
            c_print_oct(number);
          ```
        - output
          ```java
            0115%
          ```
    - **c_print_hex** - it is similar to print_number except we divide the original number not by 10 but by 16 and if the remainder goes beyond the range (0-9), then we add "A" and not "0" to it.
        - code
          ```c
            int number = 77;
            c_print_hex(number);
          ```
        - output
          ```java
            0x4D%
          ```
    - **c_print_tab** - identical to print_string, except that the original value in the rcx register is strictly set to tab (4 whitespace).
        - code
          ```c
            char* str = "tab";
            c_print_tab();
          ```
        - output
          ```java
            tab    %
          ```
    - **c_print_bytes** - this function takes a tuple of numbers and the number of elements in it, then goes through each number and calls print_number on it, increments the counter and this cycle ends only when the counter reaches the number of elements in the tuple
        - code
          ```c
            unsigned char numArr[5] = {3, 2, 1, 5, 7};
            c_print_bytes(numArr, 5);
          ```
        - output
          ```java
            [ 3, 2, 1, 5, 7 ]%
          ```
