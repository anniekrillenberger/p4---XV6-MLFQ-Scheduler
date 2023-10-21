
Modified files: 
syscall.h -- define the syscalls
syscall.c -- pointer to syscalls
sysproc.c -- implement functions
usys.S -- contains interface for user program to access system calls
user.h -- function that the user program calls
Makefile -- changing so only 1 core & disable compiler optimizations
psched.h -- pschedinfo struct, required from proj specs
