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
    - **c_print_tab** - identical to print_string, except that the original value in the rcx register is strictly set to tab (4 whitespace).
        - code
          ```c
            c_print_string("tab");
            c_print_tab();
          ```
        - output
          ```java
            tab    %
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
    - **c_print_bytes** - this function takes a tuple of numbers and the number of elements in it, then goes through each number and calls print_number on it, increments the counter and this cycle ends only when the counter reaches the number of elements in the tuple.
        - code
          ```c
            unsigned char numArr[5] = {3, 2, 1, 5, 7};
            c_print_bytes(numArr, 5);
          ```
        - output
          ```java
            [ 3, 2, 1, 5, 7 ]%
          ```
    - **c_print_f** - this is a super function that can substitute and call the functions that were mentioned above, looking at the next character after the special character "%", also catches escape characters starting with the special symbol "\".
        - code
          ```c
            c_print_f("%s %c \n\t %b %o %h %d", "String", "S", 121, 121, 121, 121);
          ```
        - output
          ```java
            String C
                0b1111001 0171  121%
          ```
2. #include **"asm_lib/`str.h`"** - this library implements functions to work with strings:
    - **c_length_string** - we go along the original string until we reach 0 bytes (the end of the string), incrementing the counter, at the end we return it.
        - code
          ```c
            int length = c_length_string("H E L L O");
            c_print_number(length);
          ```
        - output
          ```java
            9%
          ```
    - **c_number_to_string** - we create a counter and divide the number by 10 each time, add "0" to the remaining n(0-9), we get n("0"-"9"), put it on the stack, create a counter 2 from 0 to the value of the first counter, take n("0"-"9") from the stack and place it at the source address plus the offset in the form of counter2 and increase the counter when counter2 is equal to the first counter, this means that you need to put the end of line character (byte 0).
        - code
          ```c
            int number = 749;
            static unsigned char buffer[4];
            c_number_to_string(number, buffer, 4);
            c_print_string(buffer);
          ```
        - output
          ```rust
            749%
          ```
    - **c_string_to_number** - we go along the line, increment the counter, while subtracting the character "0" from n ("0"-"9"), thus, we get a number that we subsequently put on the stack. Let's create a counter2, which will correspond to the value 0 going up to the first counter, then take a number from the stack and multiply it by 10, then multiply this number by the value of counter2 (exmp: "413" == 4 * 10 * 3 + 1 * 10 * 2 + 3 * 10 * 1).
        - code
          ```c
            unsigned char* strigNUM = "983";
            unsigned int number = c_string_to_number(strigNUM);
            c_print_number(number);
          ```
        - output
          ```java
            983%
          ```
3. #include **"asm_lib/`mth.h`"** - this library implements mathematical functions:
    - **c_gcd** - this function finds the greatest common divisor according to the Euclid algorithm.
        - code
          ```c
            int gcdNUM = c_gcd(1240, 790);
            c_print_number(gcdNUM);
          ```
        - output
          ```java
            10%
          ```
    - **c_fibonacci** - this function calculates the n number fibonacci using only a loop without the stack.
        - code
          ```c
            int number = c_fibonacci(13);
            c_print_number(number);
          ```
        - output
          ```java
            233%
          ```
    - **c_factorial** - this function calculates the n number factorial using very ez algoritm in loop.
        - code
          ```c
            int number = c_factorial(5);
            c_print_number(number);
          ```
        - output
          ```java
            120%
          ```
    - **c_srand** - this is a function to generate a seed for use in subsequent function calls.
        - code
          ```c
            c_srand(43);
          ```
    - **c_rand** - the pseudorandom number generator function takes the SEED from the register and uses transformations with it with the answer of such a function is a number, if you set another SEED using the c_srand(SEED) function, you can set the SEED as times tamp (like, c_time_now) to randomness.
        - code
          ```c
            c_srand(c_time_now());
            unsigned long long int randomNumber = c_rand();
            c_print_number(randomNumber);
          ```
        - output (random number example ->)
          ```java
             1569234%
          ```
4. #include **"asm_lib/`srt.h`"** - this library implements sort algoritm functions:
    - **c_bubble_sort** - this function works according to the data until the counter becomes zero, while we look at each element, and if it is larger than the next one, then we change them with each other, each time the counter value becomes one less
        - code
          ```c
            #define size 6
            char numberArray[size] = {29, 12, 0, 99, 103, -59};
            c_bubble_sort(numberArray, size);
            c_print_bytes(numberArray, size);
          ```
        - output
          ```java
             [ 197 0 12 29 99 103 ]%
             // yes, 197 is an additional code for the digit -59
          ```
5. #include **"asm_lib/`sys.h`"** - this library implements system calls:
    - **c_exit** - this function passes the necessary parameters to the registers to terminate the program and causes a system interrupt.
        - code
          ```c
            c_exit();
          ```
