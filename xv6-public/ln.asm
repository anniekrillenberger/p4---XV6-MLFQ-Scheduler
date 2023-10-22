
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
  11:	83 3b 03             	cmpl   $0x3,(%ebx)
  14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
  16:	83 ec 08             	sub    $0x8,%esp
  19:	68 06 08 00 00       	push   $0x806
  1e:	6a 02                	push   $0x2
  20:	e8 2a 04 00 00       	call   44f <printf>
  25:	83 c4 10             	add    $0x10,%esp
    exit();
  28:	e8 9e 02 00 00       	call   2cb <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	83 c0 08             	add    $0x8,%eax
  33:	8b 10                	mov    (%eax),%edx
  35:	8b 43 04             	mov    0x4(%ebx),%eax
  38:	83 c0 04             	add    $0x4,%eax
  3b:	8b 00                	mov    (%eax),%eax
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	e8 e4 02 00 00       	call   32b <link>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	83 c0 08             	add    $0x8,%eax
  54:	8b 10                	mov    (%eax),%edx
  56:	8b 43 04             	mov    0x4(%ebx),%eax
  59:	83 c0 04             	add    $0x4,%eax
  5c:	8b 00                	mov    (%eax),%eax
  5e:	52                   	push   %edx
  5f:	50                   	push   %eax
  60:	68 19 08 00 00       	push   $0x819
  65:	6a 02                	push   $0x2
  67:	e8 e3 03 00 00       	call   44f <printf>
  6c:	83 c4 10             	add    $0x10,%esp
  exit();
  6f:	e8 57 02 00 00       	call   2cb <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	57                   	push   %edi
  78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7c:	8b 55 10             	mov    0x10(%ebp),%edx
  7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  82:	89 cb                	mov    %ecx,%ebx
  84:	89 df                	mov    %ebx,%edi
  86:	89 d1                	mov    %edx,%ecx
  88:	fc                   	cld    
  89:	f3 aa                	rep stos %al,%es:(%edi)
  8b:	89 ca                	mov    %ecx,%edx
  8d:	89 fb                	mov    %edi,%ebx
  8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  95:	90                   	nop
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 42 01             	lea    0x1(%edx),%eax
  ad:	89 45 0c             	mov    %eax,0xc(%ebp)
  b0:	8b 45 08             	mov    0x8(%ebp),%eax
  b3:	8d 48 01             	lea    0x1(%eax),%ecx
  b6:	89 4d 08             	mov    %ecx,0x8(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c8             	movzbl %al,%ecx
 103:	89 d0                	mov    %edx,%eax
 105:	29 c8                	sub    %ecx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(const char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 133:	8b 45 10             	mov    0x10(%ebp),%eax
 136:	50                   	push   %eax
 137:	ff 75 0c             	push   0xc(%ebp)
 13a:	ff 75 08             	push   0x8(%ebp)
 13d:	e8 32 ff ff ff       	call   74 <stosb>
 142:	83 c4 0c             	add    $0xc,%esp
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	38 45 fc             	cmp    %al,-0x4(%ebp)
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	6a 01                	push   $0x1
 191:	8d 45 ef             	lea    -0x11(%ebp),%eax
 194:	50                   	push   %eax
 195:	6a 00                	push   $0x0
 197:	e8 47 01 00 00       	call   2e3 <read>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
 1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ab:	8d 50 01             	lea    0x1(%eax),%edx
 1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 c2                	add    %eax,%edx
 1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	74 16                	je     1dc <gets+0x5f>
 1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ca:	3c 0d                	cmp    $0xd,%al
 1cc:	74 0e                	je     1dc <gets+0x5f>
  for(i=0; i+1 < max; ){
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1d7:	7f b3                	jg     18c <gets+0xf>
 1d9:	eb 01                	jmp    1dc <gets+0x5f>
      break;
 1db:	90                   	nop
      break;
  }
  buf[i] = '\0';
 1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	01 d0                	add    %edx,%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(const char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	83 ec 08             	sub    $0x8,%esp
 1f5:	6a 00                	push   $0x0
 1f7:	ff 75 08             	push   0x8(%ebp)
 1fa:	e8 0c 01 00 00       	call   30b <open>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 209:	79 07                	jns    212 <stat+0x26>
    return -1;
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
 212:	83 ec 08             	sub    $0x8,%esp
 215:	ff 75 0c             	push   0xc(%ebp)
 218:	ff 75 f4             	push   -0xc(%ebp)
 21b:	e8 03 01 00 00       	call   323 <fstat>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 226:	83 ec 0c             	sub    $0xc,%esp
 229:	ff 75 f4             	push   -0xc(%ebp)
 22c:	e8 c2 00 00 00       	call   2f3 <close>
 231:	83 c4 10             	add    $0x10,%esp
  return r;
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 246:	eb 25                	jmp    26d <atoi+0x34>
    n = n*10 + *s++ - '0';
 248:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24b:	89 d0                	mov    %edx,%eax
 24d:	c1 e0 02             	shl    $0x2,%eax
 250:	01 d0                	add    %edx,%eax
 252:	01 c0                	add    %eax,%eax
 254:	89 c1                	mov    %eax,%ecx
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 08             	mov    %edx,0x8(%ebp)
 25f:	0f b6 00             	movzbl (%eax),%eax
 262:	0f be c0             	movsbl %al,%eax
 265:	01 c8                	add    %ecx,%eax
 267:	83 e8 30             	sub    $0x30,%eax
 26a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2f                	cmp    $0x2f,%al
 275:	7e 0a                	jle    281 <atoi+0x48>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 39                	cmp    $0x39,%al
 27f:	7e c7                	jle    248 <atoi+0xf>
  return n;
 281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 292:	8b 45 0c             	mov    0xc(%ebp),%eax
 295:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 298:	eb 17                	jmp    2b1 <memmove+0x2b>
    *dst++ = *src++;
 29a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 29d:	8d 42 01             	lea    0x1(%edx),%eax
 2a0:	89 45 f8             	mov    %eax,-0x8(%ebp)
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 48 01             	lea    0x1(%eax),%ecx
 2a9:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 2ac:	0f b6 12             	movzbl (%edx),%edx
 2af:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
 2b4:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b7:	89 55 10             	mov    %edx,0x10(%ebp)
 2ba:	85 c0                	test   %eax,%eax
 2bc:	7f dc                	jg     29a <memmove+0x14>
  return vdst;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c3:	b8 01 00 00 00       	mov    $0x1,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <exit>:
SYSCALL(exit)
 2cb:	b8 02 00 00 00       	mov    $0x2,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <wait>:
SYSCALL(wait)
 2d3:	b8 03 00 00 00       	mov    $0x3,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <pipe>:
SYSCALL(pipe)
 2db:	b8 04 00 00 00       	mov    $0x4,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <read>:
SYSCALL(read)
 2e3:	b8 05 00 00 00       	mov    $0x5,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <write>:
SYSCALL(write)
 2eb:	b8 10 00 00 00       	mov    $0x10,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <close>:
SYSCALL(close)
 2f3:	b8 15 00 00 00       	mov    $0x15,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <kill>:
SYSCALL(kill)
 2fb:	b8 06 00 00 00       	mov    $0x6,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exec>:
SYSCALL(exec)
 303:	b8 07 00 00 00       	mov    $0x7,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <open>:
SYSCALL(open)
 30b:	b8 0f 00 00 00       	mov    $0xf,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <mknod>:
SYSCALL(mknod)
 313:	b8 11 00 00 00       	mov    $0x11,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <unlink>:
SYSCALL(unlink)
 31b:	b8 12 00 00 00       	mov    $0x12,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <fstat>:
SYSCALL(fstat)
 323:	b8 08 00 00 00       	mov    $0x8,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <link>:
SYSCALL(link)
 32b:	b8 13 00 00 00       	mov    $0x13,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <mkdir>:
SYSCALL(mkdir)
 333:	b8 14 00 00 00       	mov    $0x14,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <chdir>:
SYSCALL(chdir)
 33b:	b8 09 00 00 00       	mov    $0x9,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <dup>:
SYSCALL(dup)
 343:	b8 0a 00 00 00       	mov    $0xa,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <getpid>:
SYSCALL(getpid)
 34b:	b8 0b 00 00 00       	mov    $0xb,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sbrk>:
SYSCALL(sbrk)
 353:	b8 0c 00 00 00       	mov    $0xc,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sleep>:
SYSCALL(sleep)
 35b:	b8 0d 00 00 00       	mov    $0xd,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <uptime>:
SYSCALL(uptime)
 363:	b8 0e 00 00 00       	mov    $0xe,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <nice>:
SYSCALL(nice)
 36b:	b8 16 00 00 00       	mov    $0x16,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <getschedstate>:
SYSCALL(getschedstate)
 373:	b8 17 00 00 00       	mov    $0x17,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
 37e:	83 ec 18             	sub    $0x18,%esp
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 387:	83 ec 04             	sub    $0x4,%esp
 38a:	6a 01                	push   $0x1
 38c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38f:	50                   	push   %eax
 390:	ff 75 08             	push   0x8(%ebp)
 393:	e8 53 ff ff ff       	call   2eb <write>
 398:	83 c4 10             	add    $0x10,%esp
}
 39b:	90                   	nop
 39c:	c9                   	leave  
 39d:	c3                   	ret    

0000039e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ab:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3af:	74 17                	je     3c8 <printint+0x2a>
 3b1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b5:	79 11                	jns    3c8 <printint+0x2a>
    neg = 1;
 3b7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3be:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c1:	f7 d8                	neg    %eax
 3c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c6:	eb 06                	jmp    3ce <printint+0x30>
  } else {
    x = xx;
 3c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3db:	ba 00 00 00 00       	mov    $0x0,%edx
 3e0:	f7 f1                	div    %ecx
 3e2:	89 d1                	mov    %edx,%ecx
 3e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e7:	8d 50 01             	lea    0x1(%eax),%edx
 3ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3ed:	0f b6 91 7c 0a 00 00 	movzbl 0xa7c(%ecx),%edx
 3f4:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 3f8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fe:	ba 00 00 00 00       	mov    $0x0,%edx
 403:	f7 f1                	div    %ecx
 405:	89 45 ec             	mov    %eax,-0x14(%ebp)
 408:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 40c:	75 c7                	jne    3d5 <printint+0x37>
  if(neg)
 40e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 412:	74 2d                	je     441 <printint+0xa3>
    buf[i++] = '-';
 414:	8b 45 f4             	mov    -0xc(%ebp),%eax
 417:	8d 50 01             	lea    0x1(%eax),%edx
 41a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 41d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 422:	eb 1d                	jmp    441 <printint+0xa3>
    putc(fd, buf[i]);
 424:	8d 55 dc             	lea    -0x24(%ebp),%edx
 427:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42a:	01 d0                	add    %edx,%eax
 42c:	0f b6 00             	movzbl (%eax),%eax
 42f:	0f be c0             	movsbl %al,%eax
 432:	83 ec 08             	sub    $0x8,%esp
 435:	50                   	push   %eax
 436:	ff 75 08             	push   0x8(%ebp)
 439:	e8 3d ff ff ff       	call   37b <putc>
 43e:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 441:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 445:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 449:	79 d9                	jns    424 <printint+0x86>
}
 44b:	90                   	nop
 44c:	90                   	nop
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 455:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 45c:	8d 45 0c             	lea    0xc(%ebp),%eax
 45f:	83 c0 04             	add    $0x4,%eax
 462:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 465:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 46c:	e9 59 01 00 00       	jmp    5ca <printf+0x17b>
    c = fmt[i] & 0xff;
 471:	8b 55 0c             	mov    0xc(%ebp),%edx
 474:	8b 45 f0             	mov    -0x10(%ebp),%eax
 477:	01 d0                	add    %edx,%eax
 479:	0f b6 00             	movzbl (%eax),%eax
 47c:	0f be c0             	movsbl %al,%eax
 47f:	25 ff 00 00 00       	and    $0xff,%eax
 484:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 487:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 48b:	75 2c                	jne    4b9 <printf+0x6a>
      if(c == '%'){
 48d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 491:	75 0c                	jne    49f <printf+0x50>
        state = '%';
 493:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 49a:	e9 27 01 00 00       	jmp    5c6 <printf+0x177>
      } else {
        putc(fd, c);
 49f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a2:	0f be c0             	movsbl %al,%eax
 4a5:	83 ec 08             	sub    $0x8,%esp
 4a8:	50                   	push   %eax
 4a9:	ff 75 08             	push   0x8(%ebp)
 4ac:	e8 ca fe ff ff       	call   37b <putc>
 4b1:	83 c4 10             	add    $0x10,%esp
 4b4:	e9 0d 01 00 00       	jmp    5c6 <printf+0x177>
      }
    } else if(state == '%'){
 4b9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4bd:	0f 85 03 01 00 00    	jne    5c6 <printf+0x177>
      if(c == 'd'){
 4c3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4c7:	75 1e                	jne    4e7 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cc:	8b 00                	mov    (%eax),%eax
 4ce:	6a 01                	push   $0x1
 4d0:	6a 0a                	push   $0xa
 4d2:	50                   	push   %eax
 4d3:	ff 75 08             	push   0x8(%ebp)
 4d6:	e8 c3 fe ff ff       	call   39e <printint>
 4db:	83 c4 10             	add    $0x10,%esp
        ap++;
 4de:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e2:	e9 d8 00 00 00       	jmp    5bf <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4e7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4eb:	74 06                	je     4f3 <printf+0xa4>
 4ed:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4f1:	75 1e                	jne    511 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f6:	8b 00                	mov    (%eax),%eax
 4f8:	6a 00                	push   $0x0
 4fa:	6a 10                	push   $0x10
 4fc:	50                   	push   %eax
 4fd:	ff 75 08             	push   0x8(%ebp)
 500:	e8 99 fe ff ff       	call   39e <printint>
 505:	83 c4 10             	add    $0x10,%esp
        ap++;
 508:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50c:	e9 ae 00 00 00       	jmp    5bf <printf+0x170>
      } else if(c == 's'){
 511:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 515:	75 43                	jne    55a <printf+0x10b>
        s = (char*)*ap;
 517:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51a:	8b 00                	mov    (%eax),%eax
 51c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 51f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 523:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 527:	75 25                	jne    54e <printf+0xff>
          s = "(null)";
 529:	c7 45 f4 2d 08 00 00 	movl   $0x82d,-0xc(%ebp)
        while(*s != 0){
 530:	eb 1c                	jmp    54e <printf+0xff>
          putc(fd, *s);
 532:	8b 45 f4             	mov    -0xc(%ebp),%eax
 535:	0f b6 00             	movzbl (%eax),%eax
 538:	0f be c0             	movsbl %al,%eax
 53b:	83 ec 08             	sub    $0x8,%esp
 53e:	50                   	push   %eax
 53f:	ff 75 08             	push   0x8(%ebp)
 542:	e8 34 fe ff ff       	call   37b <putc>
 547:	83 c4 10             	add    $0x10,%esp
          s++;
 54a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 551:	0f b6 00             	movzbl (%eax),%eax
 554:	84 c0                	test   %al,%al
 556:	75 da                	jne    532 <printf+0xe3>
 558:	eb 65                	jmp    5bf <printf+0x170>
        }
      } else if(c == 'c'){
 55a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 55e:	75 1d                	jne    57d <printf+0x12e>
        putc(fd, *ap);
 560:	8b 45 e8             	mov    -0x18(%ebp),%eax
 563:	8b 00                	mov    (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	83 ec 08             	sub    $0x8,%esp
 56b:	50                   	push   %eax
 56c:	ff 75 08             	push   0x8(%ebp)
 56f:	e8 07 fe ff ff       	call   37b <putc>
 574:	83 c4 10             	add    $0x10,%esp
        ap++;
 577:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57b:	eb 42                	jmp    5bf <printf+0x170>
      } else if(c == '%'){
 57d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 581:	75 17                	jne    59a <printf+0x14b>
        putc(fd, c);
 583:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 586:	0f be c0             	movsbl %al,%eax
 589:	83 ec 08             	sub    $0x8,%esp
 58c:	50                   	push   %eax
 58d:	ff 75 08             	push   0x8(%ebp)
 590:	e8 e6 fd ff ff       	call   37b <putc>
 595:	83 c4 10             	add    $0x10,%esp
 598:	eb 25                	jmp    5bf <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59a:	83 ec 08             	sub    $0x8,%esp
 59d:	6a 25                	push   $0x25
 59f:	ff 75 08             	push   0x8(%ebp)
 5a2:	e8 d4 fd ff ff       	call   37b <putc>
 5a7:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ad:	0f be c0             	movsbl %al,%eax
 5b0:	83 ec 08             	sub    $0x8,%esp
 5b3:	50                   	push   %eax
 5b4:	ff 75 08             	push   0x8(%ebp)
 5b7:	e8 bf fd ff ff       	call   37b <putc>
 5bc:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5ca:	8b 55 0c             	mov    0xc(%ebp),%edx
 5cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d0:	01 d0                	add    %edx,%eax
 5d2:	0f b6 00             	movzbl (%eax),%eax
 5d5:	84 c0                	test   %al,%al
 5d7:	0f 85 94 fe ff ff    	jne    471 <printf+0x22>
    }
  }
}
 5dd:	90                   	nop
 5de:	90                   	nop
 5df:	c9                   	leave  
 5e0:	c3                   	ret    

000005e1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e1:	55                   	push   %ebp
 5e2:	89 e5                	mov    %esp,%ebp
 5e4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	83 e8 08             	sub    $0x8,%eax
 5ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f0:	a1 98 0a 00 00       	mov    0xa98,%eax
 5f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f8:	eb 24                	jmp    61e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fd:	8b 00                	mov    (%eax),%eax
 5ff:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 602:	72 12                	jb     616 <free+0x35>
 604:	8b 45 f8             	mov    -0x8(%ebp),%eax
 607:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60a:	77 24                	ja     630 <free+0x4f>
 60c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60f:	8b 00                	mov    (%eax),%eax
 611:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 614:	72 1a                	jb     630 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 616:	8b 45 fc             	mov    -0x4(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 621:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 624:	76 d4                	jbe    5fa <free+0x19>
 626:	8b 45 fc             	mov    -0x4(%ebp),%eax
 629:	8b 00                	mov    (%eax),%eax
 62b:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 62e:	73 ca                	jae    5fa <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 45 f8             	mov    -0x8(%ebp),%eax
 633:	8b 40 04             	mov    0x4(%eax),%eax
 636:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 63d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 640:	01 c2                	add    %eax,%edx
 642:	8b 45 fc             	mov    -0x4(%ebp),%eax
 645:	8b 00                	mov    (%eax),%eax
 647:	39 c2                	cmp    %eax,%edx
 649:	75 24                	jne    66f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 64b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64e:	8b 50 04             	mov    0x4(%eax),%edx
 651:	8b 45 fc             	mov    -0x4(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	8b 40 04             	mov    0x4(%eax),%eax
 659:	01 c2                	add    %eax,%edx
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 661:	8b 45 fc             	mov    -0x4(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	8b 10                	mov    (%eax),%edx
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	89 10                	mov    %edx,(%eax)
 66d:	eb 0a                	jmp    679 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 66f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 672:	8b 10                	mov    (%eax),%edx
 674:	8b 45 f8             	mov    -0x8(%ebp),%eax
 677:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 40 04             	mov    0x4(%eax),%eax
 67f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 686:	8b 45 fc             	mov    -0x4(%ebp),%eax
 689:	01 d0                	add    %edx,%eax
 68b:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 68e:	75 20                	jne    6b0 <free+0xcf>
    p->s.size += bp->s.size;
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 50 04             	mov    0x4(%eax),%edx
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	8b 40 04             	mov    0x4(%eax),%eax
 69c:	01 c2                	add    %eax,%edx
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a7:	8b 10                	mov    (%eax),%edx
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	89 10                	mov    %edx,(%eax)
 6ae:	eb 08                	jmp    6b8 <free+0xd7>
  } else
    p->s.ptr = bp;
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b6:	89 10                	mov    %edx,(%eax)
  freep = p;
 6b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bb:	a3 98 0a 00 00       	mov    %eax,0xa98
}
 6c0:	90                   	nop
 6c1:	c9                   	leave  
 6c2:	c3                   	ret    

000006c3 <morecore>:

static Header*
morecore(uint nu)
{
 6c3:	55                   	push   %ebp
 6c4:	89 e5                	mov    %esp,%ebp
 6c6:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6c9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d0:	77 07                	ja     6d9 <morecore+0x16>
    nu = 4096;
 6d2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	c1 e0 03             	shl    $0x3,%eax
 6df:	83 ec 0c             	sub    $0xc,%esp
 6e2:	50                   	push   %eax
 6e3:	e8 6b fc ff ff       	call   353 <sbrk>
 6e8:	83 c4 10             	add    $0x10,%esp
 6eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6ee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f2:	75 07                	jne    6fb <morecore+0x38>
    return 0;
 6f4:	b8 00 00 00 00       	mov    $0x0,%eax
 6f9:	eb 26                	jmp    721 <morecore+0x5e>
  hp = (Header*)p;
 6fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 701:	8b 45 f0             	mov    -0x10(%ebp),%eax
 704:	8b 55 08             	mov    0x8(%ebp),%edx
 707:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 70a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70d:	83 c0 08             	add    $0x8,%eax
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	50                   	push   %eax
 714:	e8 c8 fe ff ff       	call   5e1 <free>
 719:	83 c4 10             	add    $0x10,%esp
  return freep;
 71c:	a1 98 0a 00 00       	mov    0xa98,%eax
}
 721:	c9                   	leave  
 722:	c3                   	ret    

00000723 <malloc>:

void*
malloc(uint nbytes)
{
 723:	55                   	push   %ebp
 724:	89 e5                	mov    %esp,%ebp
 726:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	83 c0 07             	add    $0x7,%eax
 72f:	c1 e8 03             	shr    $0x3,%eax
 732:	83 c0 01             	add    $0x1,%eax
 735:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 738:	a1 98 0a 00 00       	mov    0xa98,%eax
 73d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 740:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 744:	75 23                	jne    769 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 746:	c7 45 f0 90 0a 00 00 	movl   $0xa90,-0x10(%ebp)
 74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 750:	a3 98 0a 00 00       	mov    %eax,0xa98
 755:	a1 98 0a 00 00       	mov    0xa98,%eax
 75a:	a3 90 0a 00 00       	mov    %eax,0xa90
    base.s.size = 0;
 75f:	c7 05 94 0a 00 00 00 	movl   $0x0,0xa94
 766:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76c:	8b 00                	mov    (%eax),%eax
 76e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 771:	8b 45 f4             	mov    -0xc(%ebp),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 77a:	77 4d                	ja     7c9 <malloc+0xa6>
      if(p->s.size == nunits)
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	8b 40 04             	mov    0x4(%eax),%eax
 782:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 785:	75 0c                	jne    793 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	8b 10                	mov    (%eax),%edx
 78c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78f:	89 10                	mov    %edx,(%eax)
 791:	eb 26                	jmp    7b9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 793:	8b 45 f4             	mov    -0xc(%ebp),%eax
 796:	8b 40 04             	mov    0x4(%eax),%eax
 799:	2b 45 ec             	sub    -0x14(%ebp),%eax
 79c:	89 c2                	mov    %eax,%edx
 79e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a7:	8b 40 04             	mov    0x4(%eax),%eax
 7aa:	c1 e0 03             	shl    $0x3,%eax
 7ad:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bc:	a3 98 0a 00 00       	mov    %eax,0xa98
      return (void*)(p + 1);
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	83 c0 08             	add    $0x8,%eax
 7c7:	eb 3b                	jmp    804 <malloc+0xe1>
    }
    if(p == freep)
 7c9:	a1 98 0a 00 00       	mov    0xa98,%eax
 7ce:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7d1:	75 1e                	jne    7f1 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	ff 75 ec             	push   -0x14(%ebp)
 7d9:	e8 e5 fe ff ff       	call   6c3 <morecore>
 7de:	83 c4 10             	add    $0x10,%esp
 7e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e8:	75 07                	jne    7f1 <malloc+0xce>
        return 0;
 7ea:	b8 00 00 00 00       	mov    $0x0,%eax
 7ef:	eb 13                	jmp    804 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7ff:	e9 6d ff ff ff       	jmp    771 <malloc+0x4e>
  }
}
 804:	c9                   	leave  
 805:	c3                   	ret    
