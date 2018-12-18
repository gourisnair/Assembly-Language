#This assembly program to print Hello, world! uses only syscalls and no libc functions

.data
stringtobeprinted:
  .ascii "Hello, World!"

.text

.globl _start

_start

  #write() syscall descripton :   ssize_t write(int fd, const void *buf, size_t count)

  #Load all the arguments for write()

  mov eax, 4                  #syscall nnumber for write()
  mov ebx, 1                  #file descriptor = 1 for stdout
  mov ecx, stringtobeprinted  #buffer, pointer to memory location containing the string
  mov edx, 13                 #string length
  int 0x80                    #interrupt to invoke the syscalls

  #To exit the program

  mov eax, 1
  mov ebx, 0
  int 0x80
