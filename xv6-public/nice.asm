
_nice:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])  {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
    int n = 0;
  11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    printf(1, "nice: %d\n", nice(n));
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	ff 75 f4             	push   -0xc(%ebp)
  1e:	e8 1a 03 00 00       	call   33d <nice>
  23:	83 c4 10             	add    $0x10,%esp
  26:	83 ec 04             	sub    $0x4,%esp
  29:	50                   	push   %eax
  2a:	68 d8 07 00 00       	push   $0x7d8
  2f:	6a 01                	push   $0x1
  31:	e8 eb 03 00 00       	call   421 <printf>
  36:	83 c4 10             	add    $0x10,%esp

    return 0;
  39:	b8 00 00 00 00       	mov    $0x0,%eax
} 
  3e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  41:	c9                   	leave  
  42:	8d 61 fc             	lea    -0x4(%ecx),%esp
  45:	c3                   	ret    

00000046 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  46:	55                   	push   %ebp
  47:	89 e5                	mov    %esp,%ebp
  49:	57                   	push   %edi
  4a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  4b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4e:	8b 55 10             	mov    0x10(%ebp),%edx
  51:	8b 45 0c             	mov    0xc(%ebp),%eax
  54:	89 cb                	mov    %ecx,%ebx
  56:	89 df                	mov    %ebx,%edi
  58:	89 d1                	mov    %edx,%ecx
  5a:	fc                   	cld    
  5b:	f3 aa                	rep stos %al,%es:(%edi)
  5d:	89 ca                	mov    %ecx,%edx
  5f:	89 fb                	mov    %edi,%ebx
  61:	89 5d 08             	mov    %ebx,0x8(%ebp)
  64:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  67:	90                   	nop
  68:	5b                   	pop    %ebx
  69:	5f                   	pop    %edi
  6a:	5d                   	pop    %ebp
  6b:	c3                   	ret    

0000006c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  78:	90                   	nop
  79:	8b 55 0c             	mov    0xc(%ebp),%edx
  7c:	8d 42 01             	lea    0x1(%edx),%eax
  7f:	89 45 0c             	mov    %eax,0xc(%ebp)
  82:	8b 45 08             	mov    0x8(%ebp),%eax
  85:	8d 48 01             	lea    0x1(%eax),%ecx
  88:	89 4d 08             	mov    %ecx,0x8(%ebp)
  8b:	0f b6 12             	movzbl (%edx),%edx
  8e:	88 10                	mov    %dl,(%eax)
  90:	0f b6 00             	movzbl (%eax),%eax
  93:	84 c0                	test   %al,%al
  95:	75 e2                	jne    79 <strcpy+0xd>
    ;
  return os;
  97:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  9a:	c9                   	leave  
  9b:	c3                   	ret    

0000009c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  9c:	55                   	push   %ebp
  9d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  9f:	eb 08                	jmp    a9 <strcmp+0xd>
    p++, q++;
  a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	84 c0                	test   %al,%al
  b1:	74 10                	je     c3 <strcmp+0x27>
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	0f b6 10             	movzbl (%eax),%edx
  b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	38 c2                	cmp    %al,%dl
  c1:	74 de                	je     a1 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	0f b6 00             	movzbl (%eax),%eax
  c9:	0f b6 d0             	movzbl %al,%edx
  cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  cf:	0f b6 00             	movzbl (%eax),%eax
  d2:	0f b6 c8             	movzbl %al,%ecx
  d5:	89 d0                	mov    %edx,%eax
  d7:	29 c8                	sub    %ecx,%eax
}
  d9:	5d                   	pop    %ebp
  da:	c3                   	ret    

000000db <strlen>:

uint
strlen(const char *s)
{
  db:	55                   	push   %ebp
  dc:	89 e5                	mov    %esp,%ebp
  de:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  e8:	eb 04                	jmp    ee <strlen+0x13>
  ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	01 d0                	add    %edx,%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	84 c0                	test   %al,%al
  fb:	75 ed                	jne    ea <strlen+0xf>
    ;
  return n;
  fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <memset>:

void*
memset(void *dst, int c, uint n)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 105:	8b 45 10             	mov    0x10(%ebp),%eax
 108:	50                   	push   %eax
 109:	ff 75 0c             	push   0xc(%ebp)
 10c:	ff 75 08             	push   0x8(%ebp)
 10f:	e8 32 ff ff ff       	call   46 <stosb>
 114:	83 c4 0c             	add    $0xc,%esp
  return dst;
 117:	8b 45 08             	mov    0x8(%ebp),%eax
}
 11a:	c9                   	leave  
 11b:	c3                   	ret    

0000011c <strchr>:

char*
strchr(const char *s, char c)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	83 ec 04             	sub    $0x4,%esp
 122:	8b 45 0c             	mov    0xc(%ebp),%eax
 125:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 128:	eb 14                	jmp    13e <strchr+0x22>
    if(*s == c)
 12a:	8b 45 08             	mov    0x8(%ebp),%eax
 12d:	0f b6 00             	movzbl (%eax),%eax
 130:	38 45 fc             	cmp    %al,-0x4(%ebp)
 133:	75 05                	jne    13a <strchr+0x1e>
      return (char*)s;
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	eb 13                	jmp    14d <strchr+0x31>
  for(; *s; s++)
 13a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 13e:	8b 45 08             	mov    0x8(%ebp),%eax
 141:	0f b6 00             	movzbl (%eax),%eax
 144:	84 c0                	test   %al,%al
 146:	75 e2                	jne    12a <strchr+0xe>
  return 0;
 148:	b8 00 00 00 00       	mov    $0x0,%eax
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    

0000014f <gets>:

char*
gets(char *buf, int max)
{
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
 152:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 155:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 15c:	eb 42                	jmp    1a0 <gets+0x51>
    cc = read(0, &c, 1);
 15e:	83 ec 04             	sub    $0x4,%esp
 161:	6a 01                	push   $0x1
 163:	8d 45 ef             	lea    -0x11(%ebp),%eax
 166:	50                   	push   %eax
 167:	6a 00                	push   $0x0
 169:	e8 47 01 00 00       	call   2b5 <read>
 16e:	83 c4 10             	add    $0x10,%esp
 171:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 174:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 178:	7e 33                	jle    1ad <gets+0x5e>
      break;
    buf[i++] = c;
 17a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17d:	8d 50 01             	lea    0x1(%eax),%edx
 180:	89 55 f4             	mov    %edx,-0xc(%ebp)
 183:	89 c2                	mov    %eax,%edx
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	01 c2                	add    %eax,%edx
 18a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 190:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 194:	3c 0a                	cmp    $0xa,%al
 196:	74 16                	je     1ae <gets+0x5f>
 198:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 19c:	3c 0d                	cmp    $0xd,%al
 19e:	74 0e                	je     1ae <gets+0x5f>
  for(i=0; i+1 < max; ){
 1a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a3:	83 c0 01             	add    $0x1,%eax
 1a6:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1a9:	7f b3                	jg     15e <gets+0xf>
 1ab:	eb 01                	jmp    1ae <gets+0x5f>
      break;
 1ad:	90                   	nop
      break;
  }
  buf[i] = '\0';
 1ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	01 d0                	add    %edx,%eax
 1b6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1bc:	c9                   	leave  
 1bd:	c3                   	ret    

000001be <stat>:

int
stat(const char *n, struct stat *st)
{
 1be:	55                   	push   %ebp
 1bf:	89 e5                	mov    %esp,%ebp
 1c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c4:	83 ec 08             	sub    $0x8,%esp
 1c7:	6a 00                	push   $0x0
 1c9:	ff 75 08             	push   0x8(%ebp)
 1cc:	e8 0c 01 00 00       	call   2dd <open>
 1d1:	83 c4 10             	add    $0x10,%esp
 1d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1db:	79 07                	jns    1e4 <stat+0x26>
    return -1;
 1dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e2:	eb 25                	jmp    209 <stat+0x4b>
  r = fstat(fd, st);
 1e4:	83 ec 08             	sub    $0x8,%esp
 1e7:	ff 75 0c             	push   0xc(%ebp)
 1ea:	ff 75 f4             	push   -0xc(%ebp)
 1ed:	e8 03 01 00 00       	call   2f5 <fstat>
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1f8:	83 ec 0c             	sub    $0xc,%esp
 1fb:	ff 75 f4             	push   -0xc(%ebp)
 1fe:	e8 c2 00 00 00       	call   2c5 <close>
 203:	83 c4 10             	add    $0x10,%esp
  return r;
 206:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 209:	c9                   	leave  
 20a:	c3                   	ret    

0000020b <atoi>:

int
atoi(const char *s)
{
 20b:	55                   	push   %ebp
 20c:	89 e5                	mov    %esp,%ebp
 20e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 211:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 218:	eb 25                	jmp    23f <atoi+0x34>
    n = n*10 + *s++ - '0';
 21a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 21d:	89 d0                	mov    %edx,%eax
 21f:	c1 e0 02             	shl    $0x2,%eax
 222:	01 d0                	add    %edx,%eax
 224:	01 c0                	add    %eax,%eax
 226:	89 c1                	mov    %eax,%ecx
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	8d 50 01             	lea    0x1(%eax),%edx
 22e:	89 55 08             	mov    %edx,0x8(%ebp)
 231:	0f b6 00             	movzbl (%eax),%eax
 234:	0f be c0             	movsbl %al,%eax
 237:	01 c8                	add    %ecx,%eax
 239:	83 e8 30             	sub    $0x30,%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 23f:	8b 45 08             	mov    0x8(%ebp),%eax
 242:	0f b6 00             	movzbl (%eax),%eax
 245:	3c 2f                	cmp    $0x2f,%al
 247:	7e 0a                	jle    253 <atoi+0x48>
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	0f b6 00             	movzbl (%eax),%eax
 24f:	3c 39                	cmp    $0x39,%al
 251:	7e c7                	jle    21a <atoi+0xf>
  return n;
 253:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 256:	c9                   	leave  
 257:	c3                   	ret    

00000258 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 25e:	8b 45 08             	mov    0x8(%ebp),%eax
 261:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 264:	8b 45 0c             	mov    0xc(%ebp),%eax
 267:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 26a:	eb 17                	jmp    283 <memmove+0x2b>
    *dst++ = *src++;
 26c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 26f:	8d 42 01             	lea    0x1(%edx),%eax
 272:	89 45 f8             	mov    %eax,-0x8(%ebp)
 275:	8b 45 fc             	mov    -0x4(%ebp),%eax
 278:	8d 48 01             	lea    0x1(%eax),%ecx
 27b:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 27e:	0f b6 12             	movzbl (%edx),%edx
 281:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 283:	8b 45 10             	mov    0x10(%ebp),%eax
 286:	8d 50 ff             	lea    -0x1(%eax),%edx
 289:	89 55 10             	mov    %edx,0x10(%ebp)
 28c:	85 c0                	test   %eax,%eax
 28e:	7f dc                	jg     26c <memmove+0x14>
  return vdst;
 290:	8b 45 08             	mov    0x8(%ebp),%eax
}
 293:	c9                   	leave  
 294:	c3                   	ret    

00000295 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 295:	b8 01 00 00 00       	mov    $0x1,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <exit>:
SYSCALL(exit)
 29d:	b8 02 00 00 00       	mov    $0x2,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <wait>:
SYSCALL(wait)
 2a5:	b8 03 00 00 00       	mov    $0x3,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <pipe>:
SYSCALL(pipe)
 2ad:	b8 04 00 00 00       	mov    $0x4,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <read>:
SYSCALL(read)
 2b5:	b8 05 00 00 00       	mov    $0x5,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <write>:
SYSCALL(write)
 2bd:	b8 10 00 00 00       	mov    $0x10,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <close>:
SYSCALL(close)
 2c5:	b8 15 00 00 00       	mov    $0x15,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <kill>:
SYSCALL(kill)
 2cd:	b8 06 00 00 00       	mov    $0x6,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <exec>:
SYSCALL(exec)
 2d5:	b8 07 00 00 00       	mov    $0x7,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <open>:
SYSCALL(open)
 2dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <mknod>:
SYSCALL(mknod)
 2e5:	b8 11 00 00 00       	mov    $0x11,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <unlink>:
SYSCALL(unlink)
 2ed:	b8 12 00 00 00       	mov    $0x12,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <fstat>:
SYSCALL(fstat)
 2f5:	b8 08 00 00 00       	mov    $0x8,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <link>:
SYSCALL(link)
 2fd:	b8 13 00 00 00       	mov    $0x13,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <mkdir>:
SYSCALL(mkdir)
 305:	b8 14 00 00 00       	mov    $0x14,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <chdir>:
SYSCALL(chdir)
 30d:	b8 09 00 00 00       	mov    $0x9,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <dup>:
SYSCALL(dup)
 315:	b8 0a 00 00 00       	mov    $0xa,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <getpid>:
SYSCALL(getpid)
 31d:	b8 0b 00 00 00       	mov    $0xb,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <sbrk>:
SYSCALL(sbrk)
 325:	b8 0c 00 00 00       	mov    $0xc,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <sleep>:
SYSCALL(sleep)
 32d:	b8 0d 00 00 00       	mov    $0xd,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <uptime>:
SYSCALL(uptime)
 335:	b8 0e 00 00 00       	mov    $0xe,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <nice>:
SYSCALL(nice)
 33d:	b8 16 00 00 00       	mov    $0x16,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <getschedstate>:
SYSCALL(getschedstate)
 345:	b8 17 00 00 00       	mov    $0x17,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	83 ec 18             	sub    $0x18,%esp
 353:	8b 45 0c             	mov    0xc(%ebp),%eax
 356:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 359:	83 ec 04             	sub    $0x4,%esp
 35c:	6a 01                	push   $0x1
 35e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 361:	50                   	push   %eax
 362:	ff 75 08             	push   0x8(%ebp)
 365:	e8 53 ff ff ff       	call   2bd <write>
 36a:	83 c4 10             	add    $0x10,%esp
}
 36d:	90                   	nop
 36e:	c9                   	leave  
 36f:	c3                   	ret    

00000370 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 376:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 37d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 381:	74 17                	je     39a <printint+0x2a>
 383:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 387:	79 11                	jns    39a <printint+0x2a>
    neg = 1;
 389:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 390:	8b 45 0c             	mov    0xc(%ebp),%eax
 393:	f7 d8                	neg    %eax
 395:	89 45 ec             	mov    %eax,-0x14(%ebp)
 398:	eb 06                	jmp    3a0 <printint+0x30>
  } else {
    x = xx;
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ad:	ba 00 00 00 00       	mov    $0x0,%edx
 3b2:	f7 f1                	div    %ecx
 3b4:	89 d1                	mov    %edx,%ecx
 3b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b9:	8d 50 01             	lea    0x1(%eax),%edx
 3bc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3bf:	0f b6 91 38 0a 00 00 	movzbl 0xa38(%ecx),%edx
 3c6:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 3ca:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d0:	ba 00 00 00 00       	mov    $0x0,%edx
 3d5:	f7 f1                	div    %ecx
 3d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3da:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3de:	75 c7                	jne    3a7 <printint+0x37>
  if(neg)
 3e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e4:	74 2d                	je     413 <printint+0xa3>
    buf[i++] = '-';
 3e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e9:	8d 50 01             	lea    0x1(%eax),%edx
 3ec:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3ef:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3f4:	eb 1d                	jmp    413 <printint+0xa3>
    putc(fd, buf[i]);
 3f6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fc:	01 d0                	add    %edx,%eax
 3fe:	0f b6 00             	movzbl (%eax),%eax
 401:	0f be c0             	movsbl %al,%eax
 404:	83 ec 08             	sub    $0x8,%esp
 407:	50                   	push   %eax
 408:	ff 75 08             	push   0x8(%ebp)
 40b:	e8 3d ff ff ff       	call   34d <putc>
 410:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 413:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 417:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 41b:	79 d9                	jns    3f6 <printint+0x86>
}
 41d:	90                   	nop
 41e:	90                   	nop
 41f:	c9                   	leave  
 420:	c3                   	ret    

00000421 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 427:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 42e:	8d 45 0c             	lea    0xc(%ebp),%eax
 431:	83 c0 04             	add    $0x4,%eax
 434:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 437:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 43e:	e9 59 01 00 00       	jmp    59c <printf+0x17b>
    c = fmt[i] & 0xff;
 443:	8b 55 0c             	mov    0xc(%ebp),%edx
 446:	8b 45 f0             	mov    -0x10(%ebp),%eax
 449:	01 d0                	add    %edx,%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	0f be c0             	movsbl %al,%eax
 451:	25 ff 00 00 00       	and    $0xff,%eax
 456:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 459:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 45d:	75 2c                	jne    48b <printf+0x6a>
      if(c == '%'){
 45f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 463:	75 0c                	jne    471 <printf+0x50>
        state = '%';
 465:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 46c:	e9 27 01 00 00       	jmp    598 <printf+0x177>
      } else {
        putc(fd, c);
 471:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 474:	0f be c0             	movsbl %al,%eax
 477:	83 ec 08             	sub    $0x8,%esp
 47a:	50                   	push   %eax
 47b:	ff 75 08             	push   0x8(%ebp)
 47e:	e8 ca fe ff ff       	call   34d <putc>
 483:	83 c4 10             	add    $0x10,%esp
 486:	e9 0d 01 00 00       	jmp    598 <printf+0x177>
      }
    } else if(state == '%'){
 48b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 48f:	0f 85 03 01 00 00    	jne    598 <printf+0x177>
      if(c == 'd'){
 495:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 499:	75 1e                	jne    4b9 <printf+0x98>
        printint(fd, *ap, 10, 1);
 49b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 49e:	8b 00                	mov    (%eax),%eax
 4a0:	6a 01                	push   $0x1
 4a2:	6a 0a                	push   $0xa
 4a4:	50                   	push   %eax
 4a5:	ff 75 08             	push   0x8(%ebp)
 4a8:	e8 c3 fe ff ff       	call   370 <printint>
 4ad:	83 c4 10             	add    $0x10,%esp
        ap++;
 4b0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4b4:	e9 d8 00 00 00       	jmp    591 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4b9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4bd:	74 06                	je     4c5 <printf+0xa4>
 4bf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4c3:	75 1e                	jne    4e3 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c8:	8b 00                	mov    (%eax),%eax
 4ca:	6a 00                	push   $0x0
 4cc:	6a 10                	push   $0x10
 4ce:	50                   	push   %eax
 4cf:	ff 75 08             	push   0x8(%ebp)
 4d2:	e8 99 fe ff ff       	call   370 <printint>
 4d7:	83 c4 10             	add    $0x10,%esp
        ap++;
 4da:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4de:	e9 ae 00 00 00       	jmp    591 <printf+0x170>
      } else if(c == 's'){
 4e3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4e7:	75 43                	jne    52c <printf+0x10b>
        s = (char*)*ap;
 4e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4ec:	8b 00                	mov    (%eax),%eax
 4ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4f1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f9:	75 25                	jne    520 <printf+0xff>
          s = "(null)";
 4fb:	c7 45 f4 e2 07 00 00 	movl   $0x7e2,-0xc(%ebp)
        while(*s != 0){
 502:	eb 1c                	jmp    520 <printf+0xff>
          putc(fd, *s);
 504:	8b 45 f4             	mov    -0xc(%ebp),%eax
 507:	0f b6 00             	movzbl (%eax),%eax
 50a:	0f be c0             	movsbl %al,%eax
 50d:	83 ec 08             	sub    $0x8,%esp
 510:	50                   	push   %eax
 511:	ff 75 08             	push   0x8(%ebp)
 514:	e8 34 fe ff ff       	call   34d <putc>
 519:	83 c4 10             	add    $0x10,%esp
          s++;
 51c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 520:	8b 45 f4             	mov    -0xc(%ebp),%eax
 523:	0f b6 00             	movzbl (%eax),%eax
 526:	84 c0                	test   %al,%al
 528:	75 da                	jne    504 <printf+0xe3>
 52a:	eb 65                	jmp    591 <printf+0x170>
        }
      } else if(c == 'c'){
 52c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 530:	75 1d                	jne    54f <printf+0x12e>
        putc(fd, *ap);
 532:	8b 45 e8             	mov    -0x18(%ebp),%eax
 535:	8b 00                	mov    (%eax),%eax
 537:	0f be c0             	movsbl %al,%eax
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	50                   	push   %eax
 53e:	ff 75 08             	push   0x8(%ebp)
 541:	e8 07 fe ff ff       	call   34d <putc>
 546:	83 c4 10             	add    $0x10,%esp
        ap++;
 549:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 54d:	eb 42                	jmp    591 <printf+0x170>
      } else if(c == '%'){
 54f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 553:	75 17                	jne    56c <printf+0x14b>
        putc(fd, c);
 555:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 558:	0f be c0             	movsbl %al,%eax
 55b:	83 ec 08             	sub    $0x8,%esp
 55e:	50                   	push   %eax
 55f:	ff 75 08             	push   0x8(%ebp)
 562:	e8 e6 fd ff ff       	call   34d <putc>
 567:	83 c4 10             	add    $0x10,%esp
 56a:	eb 25                	jmp    591 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 56c:	83 ec 08             	sub    $0x8,%esp
 56f:	6a 25                	push   $0x25
 571:	ff 75 08             	push   0x8(%ebp)
 574:	e8 d4 fd ff ff       	call   34d <putc>
 579:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 57c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57f:	0f be c0             	movsbl %al,%eax
 582:	83 ec 08             	sub    $0x8,%esp
 585:	50                   	push   %eax
 586:	ff 75 08             	push   0x8(%ebp)
 589:	e8 bf fd ff ff       	call   34d <putc>
 58e:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 591:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 598:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 59c:	8b 55 0c             	mov    0xc(%ebp),%edx
 59f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a2:	01 d0                	add    %edx,%eax
 5a4:	0f b6 00             	movzbl (%eax),%eax
 5a7:	84 c0                	test   %al,%al
 5a9:	0f 85 94 fe ff ff    	jne    443 <printf+0x22>
    }
  }
}
 5af:	90                   	nop
 5b0:	90                   	nop
 5b1:	c9                   	leave  
 5b2:	c3                   	ret    

000005b3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b3:	55                   	push   %ebp
 5b4:	89 e5                	mov    %esp,%ebp
 5b6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	83 e8 08             	sub    $0x8,%eax
 5bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c2:	a1 54 0a 00 00       	mov    0xa54,%eax
 5c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ca:	eb 24                	jmp    5f0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5cf:	8b 00                	mov    (%eax),%eax
 5d1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 5d4:	72 12                	jb     5e8 <free+0x35>
 5d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5dc:	77 24                	ja     602 <free+0x4f>
 5de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 5e6:	72 1a                	jb     602 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5eb:	8b 00                	mov    (%eax),%eax
 5ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f6:	76 d4                	jbe    5cc <free+0x19>
 5f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fb:	8b 00                	mov    (%eax),%eax
 5fd:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 600:	73 ca                	jae    5cc <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 602:	8b 45 f8             	mov    -0x8(%ebp),%eax
 605:	8b 40 04             	mov    0x4(%eax),%eax
 608:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 60f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 612:	01 c2                	add    %eax,%edx
 614:	8b 45 fc             	mov    -0x4(%ebp),%eax
 617:	8b 00                	mov    (%eax),%eax
 619:	39 c2                	cmp    %eax,%edx
 61b:	75 24                	jne    641 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 61d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 620:	8b 50 04             	mov    0x4(%eax),%edx
 623:	8b 45 fc             	mov    -0x4(%ebp),%eax
 626:	8b 00                	mov    (%eax),%eax
 628:	8b 40 04             	mov    0x4(%eax),%eax
 62b:	01 c2                	add    %eax,%edx
 62d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 630:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 633:	8b 45 fc             	mov    -0x4(%ebp),%eax
 636:	8b 00                	mov    (%eax),%eax
 638:	8b 10                	mov    (%eax),%edx
 63a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63d:	89 10                	mov    %edx,(%eax)
 63f:	eb 0a                	jmp    64b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 641:	8b 45 fc             	mov    -0x4(%ebp),%eax
 644:	8b 10                	mov    (%eax),%edx
 646:	8b 45 f8             	mov    -0x8(%ebp),%eax
 649:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 40 04             	mov    0x4(%eax),%eax
 651:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 658:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65b:	01 d0                	add    %edx,%eax
 65d:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 660:	75 20                	jne    682 <free+0xcf>
    p->s.size += bp->s.size;
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 50 04             	mov    0x4(%eax),%edx
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	8b 40 04             	mov    0x4(%eax),%eax
 66e:	01 c2                	add    %eax,%edx
 670:	8b 45 fc             	mov    -0x4(%ebp),%eax
 673:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 676:	8b 45 f8             	mov    -0x8(%ebp),%eax
 679:	8b 10                	mov    (%eax),%edx
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	89 10                	mov    %edx,(%eax)
 680:	eb 08                	jmp    68a <free+0xd7>
  } else
    p->s.ptr = bp;
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	8b 55 f8             	mov    -0x8(%ebp),%edx
 688:	89 10                	mov    %edx,(%eax)
  freep = p;
 68a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68d:	a3 54 0a 00 00       	mov    %eax,0xa54
}
 692:	90                   	nop
 693:	c9                   	leave  
 694:	c3                   	ret    

00000695 <morecore>:

static Header*
morecore(uint nu)
{
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 69b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6a2:	77 07                	ja     6ab <morecore+0x16>
    nu = 4096;
 6a4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	c1 e0 03             	shl    $0x3,%eax
 6b1:	83 ec 0c             	sub    $0xc,%esp
 6b4:	50                   	push   %eax
 6b5:	e8 6b fc ff ff       	call   325 <sbrk>
 6ba:	83 c4 10             	add    $0x10,%esp
 6bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6c0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6c4:	75 07                	jne    6cd <morecore+0x38>
    return 0;
 6c6:	b8 00 00 00 00       	mov    $0x0,%eax
 6cb:	eb 26                	jmp    6f3 <morecore+0x5e>
  hp = (Header*)p;
 6cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d6:	8b 55 08             	mov    0x8(%ebp),%edx
 6d9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6df:	83 c0 08             	add    $0x8,%eax
 6e2:	83 ec 0c             	sub    $0xc,%esp
 6e5:	50                   	push   %eax
 6e6:	e8 c8 fe ff ff       	call   5b3 <free>
 6eb:	83 c4 10             	add    $0x10,%esp
  return freep;
 6ee:	a1 54 0a 00 00       	mov    0xa54,%eax
}
 6f3:	c9                   	leave  
 6f4:	c3                   	ret    

000006f5 <malloc>:

void*
malloc(uint nbytes)
{
 6f5:	55                   	push   %ebp
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	83 c0 07             	add    $0x7,%eax
 701:	c1 e8 03             	shr    $0x3,%eax
 704:	83 c0 01             	add    $0x1,%eax
 707:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 70a:	a1 54 0a 00 00       	mov    0xa54,%eax
 70f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 712:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 716:	75 23                	jne    73b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 718:	c7 45 f0 4c 0a 00 00 	movl   $0xa4c,-0x10(%ebp)
 71f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 722:	a3 54 0a 00 00       	mov    %eax,0xa54
 727:	a1 54 0a 00 00       	mov    0xa54,%eax
 72c:	a3 4c 0a 00 00       	mov    %eax,0xa4c
    base.s.size = 0;
 731:	c7 05 50 0a 00 00 00 	movl   $0x0,0xa50
 738:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 73b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73e:	8b 00                	mov    (%eax),%eax
 740:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 743:	8b 45 f4             	mov    -0xc(%ebp),%eax
 746:	8b 40 04             	mov    0x4(%eax),%eax
 749:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 74c:	77 4d                	ja     79b <malloc+0xa6>
      if(p->s.size == nunits)
 74e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 751:	8b 40 04             	mov    0x4(%eax),%eax
 754:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 757:	75 0c                	jne    765 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 759:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75c:	8b 10                	mov    (%eax),%edx
 75e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 761:	89 10                	mov    %edx,(%eax)
 763:	eb 26                	jmp    78b <malloc+0x96>
      else {
        p->s.size -= nunits;
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	8b 40 04             	mov    0x4(%eax),%eax
 76b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 76e:	89 c2                	mov    %eax,%edx
 770:	8b 45 f4             	mov    -0xc(%ebp),%eax
 773:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 776:	8b 45 f4             	mov    -0xc(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	c1 e0 03             	shl    $0x3,%eax
 77f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 782:	8b 45 f4             	mov    -0xc(%ebp),%eax
 785:	8b 55 ec             	mov    -0x14(%ebp),%edx
 788:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 78b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78e:	a3 54 0a 00 00       	mov    %eax,0xa54
      return (void*)(p + 1);
 793:	8b 45 f4             	mov    -0xc(%ebp),%eax
 796:	83 c0 08             	add    $0x8,%eax
 799:	eb 3b                	jmp    7d6 <malloc+0xe1>
    }
    if(p == freep)
 79b:	a1 54 0a 00 00       	mov    0xa54,%eax
 7a0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7a3:	75 1e                	jne    7c3 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7a5:	83 ec 0c             	sub    $0xc,%esp
 7a8:	ff 75 ec             	push   -0x14(%ebp)
 7ab:	e8 e5 fe ff ff       	call   695 <morecore>
 7b0:	83 c4 10             	add    $0x10,%esp
 7b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ba:	75 07                	jne    7c3 <malloc+0xce>
        return 0;
 7bc:	b8 00 00 00 00       	mov    $0x0,%eax
 7c1:	eb 13                	jmp    7d6 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cc:	8b 00                	mov    (%eax),%eax
 7ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d1:	e9 6d ff ff ff       	jmp    743 <malloc+0x4e>
  }
}
 7d6:	c9                   	leave  
 7d7:	c3                   	ret    
