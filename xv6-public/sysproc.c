#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "psched.h"
#include "stddef.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;        // sleep duration in ticks
  // uint ticks0;  // initial value of system timer

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  // ticks0 = ticks;     // ticks -- curr val of sys timer
  // while(ticks - ticks0 < n) {
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }

    int sleepTime = ticks + n;

    myproc()->isSleeping = 1;   // ADDED CODE
    sleep(&sleepTime, &tickslock);
    
  // }

  // ADDED CODE
  myproc()->isSleeping = 0;

  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

// set current process's nice value to niceVal and return previous nice value
int sys_nice(void) {
  int niceVal;

  // error handling for invalid argument
  if(argint(0, &niceVal) < 0 || niceVal < 0 || niceVal > 20) return -1;

  // get current process & sched object
  struct proc *curproc = myproc();

  // store old nice value
  int oldNice = curproc->nice;

  // set new nice value
  curproc->nice = niceVal;

  // return old niceVal
  return oldNice;
}

// fill in the structure pschedinfo
int sys_getschedstate(void) { 
  struct pschedinfo* pi;

  // error hanlding
  if (argptr(0, (void*)&pi, sizeof(struct pschedinfo)) < 0) {
    return -1;
  }
  if(pi == NULL) {
    return -1;
  }

  return getschedstate(pi);
}