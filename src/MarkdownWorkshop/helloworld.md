# Helloworld Programs

![](./helloworld.png)

We list below Helloworld programs for diﬀerent programming languages, i.e. programs that print "Hello, World!". The
specified compiler or interpreter is required for each programming languages.

The table below summarizes the programs:
<br>
<br>

| Language | Language (Spec) Site | Section | Build / Run Toolchain | Debian / Ubuntu Packages |
| -------- | -------------------- | ------- | --------------------- | ------------------------ |
| C        | [The Standard - C](https://www.iso-9899.info/wiki/The_Standard)| [C](#c) | GCC | build-essetial |
| C++ | [The Standard - C++](https://isocpp.org/std/the-standard) | [C++](https://github.com/florianAriasu/workshop-markdown/blob/cdl-26/helloworld.md#c-1) | GCC / G++ | build-essential, g++ |
| Dlang | [D Programming Language:<br> Home](https://dlang.org/) | [Dlang](#dlang) | GCC / GDC | build-essential, gdc |
| Go | [The Go Programming Language](https://go.dev/) | [Go](#go) | Go | golang |
| Rust | [Rust Programming Language](https://www.rust-lang.org/) | [Rust](#rust) | Rust(Crate) | rustlang |
| Java | [Java Programming Language](https://docs.oracle.com/javase/8/docs/technotes/guides/language/#:~:text=The%20Java%E2%84%A2%20Programming%20Language,the%20Java%20Virtual%20Machine%20Specification.) | [Java](#java) | JDK | openjdk-17-jdk |
| x86_64 assembly | [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/) | [x86_64 Assembly](#x86_64-assembly) | GCC / GAS | build-essential |
| ARM64 Assembly | [Arm A64 Instruction Set Architecture](https://developer.arm.com/documentation/ddi0596/latest/) | [ARM64<br> Assembly](#arm64-assembly) | GCC / GAS<br> (AArch64) | build-essential |
| Bash | [Bash Reference Manual](https://www.gnu.org/software/bash/) | [Bash](#bash) | Bash | bash |
| Python | [Welcome to Python.org](https://www.python.org/) | [Python](#python) | Python | python |
| Ruby | [Ruby Programming Language](https://www.ruby-lang.org/en/) | [Ruby](#ruby) | Ruby | ruby |
| PHP | [PHP: Hypertext Preprocessor](https://www.php.net/) | [PHP](#php) | PHP | php |
| Perl | [The Perl Programming<br> Language](https://www.perl.org/) | [Perl](#perl) | Perl | perl |
| Lua | [The Programming Language<br> Lua](https://www.lua.org/) | [Lua](#lua) | Lua | lua |


# C
```console

#include <stdio.h>

int main(void)
{
    puts("Hello, World!");
    return 0;
}
```
Build with:

```console
gcc -Wall -o helloworld helloworld.c
```

Run with:

```console
./helloworld
```

# C++
```console

#include <iostream>

int main()
{
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
```
Build with:

```console
g++ -Wall -o helloworld helloworld.cpp
```

Run with:

```console
./helloworld
```

# Dlang
```console

import std.stdio;

void main()
{
    writeln("Hello, World!");
}
```
Build with:

```console
gdc -Wall -o helloworld helloworld.cpp
```

Run with:

```console
./helloworld
```

# Go
```console

package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```
Build and run with:

```console
go run helloworld.go
```

# Rust
```console

fn main() {
    println!("Hello, World");
}
```
Build with:

```console
rustc hello.rs
```

Run with:

```console
./helloworld
```
# Java
```console

public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```
Build with:

```console
javac HelloWorld.java
```

Run with:

```console
java HelloWorld
```
# x86_64 assembly
```console

section .data               ; Section for initialized data
    hello db 'Hello, World!', 0   ; Null-terminated string

section .text               ; Section for code
    global _start           ; Entry point for the program

_start:                    ; Main program entry point
    ; Write the string to stdout
    mov rax, 1            ; syscall: write
    mov rdi, 1            ; file descriptor: stdout
    mov rsi, hello         ; pointer to the string
    mov rdx, 13            ; length of the string
    syscall                ; invoke the kernel

    ; Exit the program
    mov rax, 60           ; syscall: exit
    xor rdi, rdi          ; status: 0
    syscall                ; invoke the kernel

```
Build with:

```console
nasm -f elf64 helloworld.asm -o helloworld.o
ld helloworld.o -o helloworld
```

Run with:

```console
./helloworld
```
# ARM64 assembly
```console

.section .data
    hello:  .asciz "Hello, World!\n"  # The string to print

.section .text
    .global _start

_start:
    // Write the string to stdout
    mov x0, 1                   // File descriptor (stdout)
    ldr x1, =hello              // Pointer to the string
    ldr x2, =13                 // Length of the string
    mov x8, 64                  // Syscall number for write
    svc 0                       // Make syscall

    // Exit the program
    mov x0, 0                   // Exit code
    mov x8, 93                  // Syscall number for exit
    svc 0                       // Make syscall

```
Build with:

```console
nasm -f aarch64 helloworld.asm -o helloworld.o
ld helloworld.o -o helloworld
```

Run with:

```console
./helloworld
```
# Bash
```console

echo "Hello, World!"
```
Run with:

```console
bash helloworld.sh
```
# Python
```console

print("Hello, World!")
```
Run with:

```console
python helloworld.py
```
# Ruby
```console

puts "Hello, World!"
```
Run with:

```console
ruby helloworld.rb
```
# PHP
```console

<?php
echo "Hello, World!"
?>
```
Run with:

```console
./helloworld
```
# Perl
```console

print("Hello, World!\n")
```
Run with:

```console
perl helloworld.pl
```
# Lua
```console

print("Hello, World!")
```
Run with:

```console
lua helloworld.lua
```
