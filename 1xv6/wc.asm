
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  int fd, i;

  if(argc <= 1){
   5:	be 01 00 00 00       	mov    $0x1,%esi
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 45 0c             	mov    0xc(%ebp),%eax
  int fd, i;

  if(argc <= 1){
  14:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  18:	8d 58 04             	lea    0x4(%eax),%ebx
  1b:	7e 6e                	jle    8b <main+0x8b>
  1d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 d8 03 00 00       	call   40a <open>
  32:	85 c0                	test   %eax,%eax
  34:	89 c7                	mov    %eax,%edi
  36:	78 2d                	js     65 <main+0x65>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit(0);
    }
    wc(fd, argv[i]);
  38:	8b 13                	mov    (%ebx),%edx
  if(argc <= 1){
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
  3a:	83 c6 01             	add    $0x1,%esi
  3d:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit(0);
    }
    wc(fd, argv[i]);
  40:	89 04 24             	mov    %eax,(%esp)
  43:	89 54 24 04          	mov    %edx,0x4(%esp)
  47:	e8 64 00 00 00       	call   b0 <wc>
    close(fd);
  4c:	89 3c 24             	mov    %edi,(%esp)
  4f:	e8 9e 03 00 00       	call   3f2 <close>
  if(argc <= 1){
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
  54:	3b 75 08             	cmp    0x8(%ebp),%esi
  57:	75 c7                	jne    20 <main+0x20>
      exit(0);
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit(0);
  59:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  60:	e8 5d 03 00 00       	call   3c2 <exit>
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
  65:	8b 03                	mov    (%ebx),%eax
  67:	c7 44 24 04 a9 08 00 	movl   $0x8a9,0x4(%esp)
  6e:	00 
  6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  76:	89 44 24 08          	mov    %eax,0x8(%esp)
  7a:	e8 a1 04 00 00       	call   520 <printf>
      exit(0);
  7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  86:	e8 37 03 00 00       	call   3c2 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
  8b:	c7 44 24 04 9b 08 00 	movl   $0x89b,0x4(%esp)
  92:	00 
  93:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9a:	e8 11 00 00 00       	call   b0 <wc>
    exit(0);
  9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a6:	e8 17 03 00 00       	call   3c2 <exit>
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  b5:	31 f6                	xor    %esi,%esi

char buf[512];

void
wc(int fd, char *name)
{
  b7:	53                   	push   %ebx
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  b8:	31 db                	xor    %ebx,%ebx

char buf[512];

void
wc(int fd, char *name)
{
  ba:	83 ec 3c             	sub    $0x3c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  bd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  d0:	8b 45 08             	mov    0x8(%ebp),%eax
  d3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  da:	00 
  db:	c7 44 24 04 a0 0b 00 	movl   $0xba0,0x4(%esp)
  e2:	00 
  e3:	89 04 24             	mov    %eax,(%esp)
  e6:	e8 f7 02 00 00       	call   3e2 <read>
  eb:	83 f8 00             	cmp    $0x0,%eax
  ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  f1:	7e 54                	jle    147 <wc+0x97>
  f3:	31 ff                	xor    %edi,%edi
  f5:	eb 0b                	jmp    102 <wc+0x52>
  f7:	90                   	nop
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
  f8:	31 f6                	xor    %esi,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  fa:	83 c7 01             	add    $0x1,%edi
  fd:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
 100:	74 38                	je     13a <wc+0x8a>
      c++;
      if(buf[i] == '\n')
 102:	0f be 87 a0 0b 00 00 	movsbl 0xba0(%edi),%eax
        l++;
 109:	31 c9                	xor    %ecx,%ecx
      if(strchr(" \r\t\n\v", buf[i]))
 10b:	c7 04 24 86 08 00 00 	movl   $0x886,(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
 112:	3c 0a                	cmp    $0xa,%al
 114:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 117:	89 44 24 04          	mov    %eax,0x4(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
 11b:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 11d:	e8 4e 01 00 00       	call   270 <strchr>
 122:	85 c0                	test   %eax,%eax
 124:	75 d2                	jne    f8 <wc+0x48>
        inword = 0;
      else if(!inword){
 126:	85 f6                	test   %esi,%esi
 128:	75 16                	jne    140 <wc+0x90>
        w++;
 12a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 12e:	83 c7 01             	add    $0x1,%edi
 131:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
 134:	66 be 01 00          	mov    $0x1,%si
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 138:	75 c8                	jne    102 <wc+0x52>
 13a:	01 7d dc             	add    %edi,-0x24(%ebp)
 13d:	eb 91                	jmp    d0 <wc+0x20>
 13f:	90                   	nop
 140:	be 01 00 00 00       	mov    $0x1,%esi
 145:	eb b3                	jmp    fa <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
 147:	75 35                	jne    17e <wc+0xce>
    printf(1, "wc: read error\n");
    exit(0);
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
 149:	8b 45 0c             	mov    0xc(%ebp),%eax
 14c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 150:	c7 44 24 04 9c 08 00 	movl   $0x89c,0x4(%esp)
 157:	00 
 158:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 15f:	89 44 24 14          	mov    %eax,0x14(%esp)
 163:	8b 45 dc             	mov    -0x24(%ebp),%eax
 166:	89 44 24 10          	mov    %eax,0x10(%esp)
 16a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 16d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 171:	e8 aa 03 00 00       	call   520 <printf>
}
 176:	83 c4 3c             	add    $0x3c,%esp
 179:	5b                   	pop    %ebx
 17a:	5e                   	pop    %esi
 17b:	5f                   	pop    %edi
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 17e:	c7 44 24 04 8c 08 00 	movl   $0x88c,0x4(%esp)
 185:	00 
 186:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18d:	e8 8e 03 00 00       	call   520 <printf>
    exit(0);
 192:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 199:	e8 24 02 00 00       	call   3c2 <exit>
 19e:	66 90                	xchg   %ax,%ax

000001a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1aa:	89 c2                	mov    %eax,%edx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b0:	83 c1 01             	add    $0x1,%ecx
 1b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1b7:	83 c2 01             	add    $0x1,%edx
 1ba:	84 db                	test   %bl,%bl
 1bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 1bf:	75 ef                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1c1:	5b                   	pop    %ebx
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
 1d6:	53                   	push   %ebx
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1da:	0f b6 02             	movzbl (%edx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	74 2d                	je     20e <strcmp+0x3e>
 1e1:	0f b6 19             	movzbl (%ecx),%ebx
 1e4:	38 d8                	cmp    %bl,%al
 1e6:	74 0e                	je     1f6 <strcmp+0x26>
 1e8:	eb 2b                	jmp    215 <strcmp+0x45>
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f0:	38 c8                	cmp    %cl,%al
 1f2:	75 15                	jne    209 <strcmp+0x39>
    p++, q++;
 1f4:	89 d9                	mov    %ebx,%ecx
 1f6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1fc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 203:	84 c0                	test   %al,%al
 205:	75 e9                	jne    1f0 <strcmp+0x20>
 207:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 209:	29 c8                	sub    %ecx,%eax
}
 20b:	5b                   	pop    %ebx
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 211:	31 c0                	xor    %eax,%eax
 213:	eb f4                	jmp    209 <strcmp+0x39>
 215:	0f b6 cb             	movzbl %bl,%ecx
 218:	eb ef                	jmp    209 <strcmp+0x39>
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000220 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 39 00             	cmpb   $0x0,(%ecx)
 229:	74 12                	je     23d <strlen+0x1d>
 22b:	31 d2                	xor    %edx,%edx
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 23d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	eb 0d                	jmp    250 <memset>
 243:	90                   	nop
 244:	90                   	nop
 245:	90                   	nop
 246:	90                   	nop
 247:	90                   	nop
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 55 08             	mov    0x8(%ebp),%edx
 256:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	89 d0                	mov    %edx,%eax
 264:	5f                   	pop    %edi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	53                   	push   %ebx
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 27a:	0f b6 18             	movzbl (%eax),%ebx
 27d:	84 db                	test   %bl,%bl
 27f:	74 1d                	je     29e <strchr+0x2e>
    if(*s == c)
 281:	38 d3                	cmp    %dl,%bl
 283:	89 d1                	mov    %edx,%ecx
 285:	75 0d                	jne    294 <strchr+0x24>
 287:	eb 17                	jmp    2a0 <strchr+0x30>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 290:	38 ca                	cmp    %cl,%dl
 292:	74 0c                	je     2a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 294:	83 c0 01             	add    $0x1,%eax
 297:	0f b6 10             	movzbl (%eax),%edx
 29a:	84 d2                	test   %dl,%dl
 29c:	75 f2                	jne    290 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 29e:	31 c0                	xor    %eax,%eax
}
 2a0:	5b                   	pop    %ebx
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
 2a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 2b7:	53                   	push   %ebx
 2b8:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2be:	eb 31                	jmp    2f1 <gets+0x41>
    cc = read(0, &c, 1);
 2c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2c7:	00 
 2c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2d3:	e8 0a 01 00 00       	call   3e2 <read>
    if(cc < 1)
 2d8:	85 c0                	test   %eax,%eax
 2da:	7e 1d                	jle    2f9 <gets+0x49>
      break;
    buf[i++] = c;
 2dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 2e5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2eb:	74 0c                	je     2f9 <gets+0x49>
 2ed:	3c 0a                	cmp    $0xa,%al
 2ef:	74 08                	je     2f9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2f7:	7c c7                	jl     2c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 300:	83 c4 2c             	add    $0x2c,%esp
 303:	5b                   	pop    %ebx
 304:	5e                   	pop    %esi
 305:	5f                   	pop    %edi
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
 308:	90                   	nop
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <stat>:

int
stat(char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
 315:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 322:	00 
 323:	89 04 24             	mov    %eax,(%esp)
 326:	e8 df 00 00 00       	call   40a <open>
  if(fd < 0)
 32b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 32d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 32f:	78 27                	js     358 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	89 1c 24             	mov    %ebx,(%esp)
 337:	89 44 24 04          	mov    %eax,0x4(%esp)
 33b:	e8 e2 00 00 00       	call   422 <fstat>
  close(fd);
 340:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 343:	89 c6                	mov    %eax,%esi
  close(fd);
 345:	e8 a8 00 00 00       	call   3f2 <close>
  return r;
 34a:	89 f0                	mov    %esi,%eax
}
 34c:	83 c4 10             	add    $0x10,%esp
 34f:	5b                   	pop    %ebx
 350:	5e                   	pop    %esi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    
 353:	90                   	nop
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 358:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 35d:	eb ed                	jmp    34c <stat+0x3c>
 35f:	90                   	nop

00000360 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 4d 08             	mov    0x8(%ebp),%ecx
 366:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 11             	movsbl (%ecx),%edx
 36a:	8d 42 d0             	lea    -0x30(%edx),%eax
 36d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 36f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 374:	77 17                	ja     38d <atoi+0x2d>
 376:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 378:	83 c1 01             	add    $0x1,%ecx
 37b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 37e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 382:	0f be 11             	movsbl (%ecx),%edx
 385:	8d 5a d0             	lea    -0x30(%edx),%ebx
 388:	80 fb 09             	cmp    $0x9,%bl
 38b:	76 eb                	jbe    378 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 38d:	5b                   	pop    %ebx
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    

00000390 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 390:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 391:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 393:	89 e5                	mov    %esp,%ebp
 395:	56                   	push   %esi
 396:	8b 45 08             	mov    0x8(%ebp),%eax
 399:	53                   	push   %ebx
 39a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 39d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a0:	85 db                	test   %ebx,%ebx
 3a2:	7e 12                	jle    3b6 <memmove+0x26>
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b2:	39 da                	cmp    %ebx,%edx
 3b4:	75 f2                	jne    3a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    

000003ba <fork>:
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret


SYSCALL(fork)
 3ba:	b8 01 00 00 00       	mov    $0x1,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <exit>:
SYSCALL(exit)
 3c2:	b8 02 00 00 00       	mov    $0x2,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <wait>:
SYSCALL(wait)
 3ca:	b8 03 00 00 00       	mov    $0x3,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <waitpid>:
SYSCALL(waitpid)
 3d2:	b8 16 00 00 00       	mov    $0x16,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <pipe>:
SYSCALL(pipe)
 3da:	b8 04 00 00 00       	mov    $0x4,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <read>:
SYSCALL(read)
 3e2:	b8 05 00 00 00       	mov    $0x5,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <write>:
SYSCALL(write)
 3ea:	b8 10 00 00 00       	mov    $0x10,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <close>:
SYSCALL(close)
 3f2:	b8 15 00 00 00       	mov    $0x15,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <kill>:
SYSCALL(kill)
 3fa:	b8 06 00 00 00       	mov    $0x6,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <exec>:
SYSCALL(exec)
 402:	b8 07 00 00 00       	mov    $0x7,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <open>:
SYSCALL(open)
 40a:	b8 0f 00 00 00       	mov    $0xf,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <mknod>:
SYSCALL(mknod)
 412:	b8 11 00 00 00       	mov    $0x11,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <unlink>:
SYSCALL(unlink)
 41a:	b8 12 00 00 00       	mov    $0x12,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <fstat>:
SYSCALL(fstat)
 422:	b8 08 00 00 00       	mov    $0x8,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <link>:
SYSCALL(link)
 42a:	b8 13 00 00 00       	mov    $0x13,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <mkdir>:
SYSCALL(mkdir)
 432:	b8 14 00 00 00       	mov    $0x14,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <chdir>:
SYSCALL(chdir)
 43a:	b8 09 00 00 00       	mov    $0x9,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <dup>:
SYSCALL(dup)
 442:	b8 0a 00 00 00       	mov    $0xa,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <getpid>:
SYSCALL(getpid)
 44a:	b8 0b 00 00 00       	mov    $0xb,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <sbrk>:
SYSCALL(sbrk)
 452:	b8 0c 00 00 00       	mov    $0xc,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <setprior>:
SYSCALL(setprior)
 45a:	b8 17 00 00 00       	mov    $0x17,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <sleep>:
SYSCALL(sleep)
 462:	b8 0d 00 00 00       	mov    $0xd,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <uptime>:
SYSCALL(uptime)
 46a:	b8 0e 00 00 00       	mov    $0xe,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    
 472:	66 90                	xchg   %ax,%ax
 474:	66 90                	xchg   %ax,%ax
 476:	66 90                	xchg   %ax,%ax
 478:	66 90                	xchg   %ax,%ax
 47a:	66 90                	xchg   %ax,%ax
 47c:	66 90                	xchg   %ax,%ax
 47e:	66 90                	xchg   %ax,%ax

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	89 c6                	mov    %eax,%esi
 487:	53                   	push   %ebx
 488:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 48e:	85 db                	test   %ebx,%ebx
 490:	74 09                	je     49b <printint+0x1b>
 492:	89 d0                	mov    %edx,%eax
 494:	c1 e8 1f             	shr    $0x1f,%eax
 497:	84 c0                	test   %al,%al
 499:	75 75                	jne    510 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 49b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 49d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4a4:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 4a7:	31 ff                	xor    %edi,%edi
 4a9:	89 ce                	mov    %ecx,%esi
 4ab:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4ae:	eb 02                	jmp    4b2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 4b0:	89 cf                	mov    %ecx,%edi
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	f7 f6                	div    %esi
 4b6:	8d 4f 01             	lea    0x1(%edi),%ecx
 4b9:	0f b6 92 c4 08 00 00 	movzbl 0x8c4(%edx),%edx
  }while((x /= base) != 0);
 4c0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4c2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4c5:	75 e9                	jne    4b0 <printint+0x30>
  if(neg)
 4c7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4ca:	89 c8                	mov    %ecx,%eax
 4cc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 4cf:	85 d2                	test   %edx,%edx
 4d1:	74 08                	je     4db <printint+0x5b>
    buf[i++] = '-';
 4d3:	8d 4f 02             	lea    0x2(%edi),%ecx
 4d6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4db:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4de:	66 90                	xchg   %ax,%ax
 4e0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4e5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ef:	00 
 4f0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4f4:	89 34 24             	mov    %esi,(%esp)
 4f7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4fa:	e8 eb fe ff ff       	call   3ea <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ff:	83 ff ff             	cmp    $0xffffffff,%edi
 502:	75 dc                	jne    4e0 <printint+0x60>
    putc(fd, buf[i]);
}
 504:	83 c4 4c             	add    $0x4c,%esp
 507:	5b                   	pop    %ebx
 508:	5e                   	pop    %esi
 509:	5f                   	pop    %edi
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 510:	89 d0                	mov    %edx,%eax
 512:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 514:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 51b:	eb 87                	jmp    4a4 <printint+0x24>
 51d:	8d 76 00             	lea    0x0(%esi),%esi

00000520 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 524:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 526:	56                   	push   %esi
 527:	53                   	push   %ebx
 528:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 52b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 52e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 531:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 534:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 537:	0f b6 13             	movzbl (%ebx),%edx
 53a:	83 c3 01             	add    $0x1,%ebx
 53d:	84 d2                	test   %dl,%dl
 53f:	75 39                	jne    57a <printf+0x5a>
 541:	e9 c2 00 00 00       	jmp    608 <printf+0xe8>
 546:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 548:	83 fa 25             	cmp    $0x25,%edx
 54b:	0f 84 bf 00 00 00    	je     610 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 551:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 554:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 55b:	00 
 55c:	89 44 24 04          	mov    %eax,0x4(%esp)
 560:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 563:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 566:	e8 7f fe ff ff       	call   3ea <write>
 56b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 56e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 572:	84 d2                	test   %dl,%dl
 574:	0f 84 8e 00 00 00    	je     608 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 57a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 57c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 57f:	74 c7                	je     548 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 581:	83 ff 25             	cmp    $0x25,%edi
 584:	75 e5                	jne    56b <printf+0x4b>
      if(c == 'd'){
 586:	83 fa 64             	cmp    $0x64,%edx
 589:	0f 84 31 01 00 00    	je     6c0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 58f:	25 f7 00 00 00       	and    $0xf7,%eax
 594:	83 f8 70             	cmp    $0x70,%eax
 597:	0f 84 83 00 00 00    	je     620 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 59d:	83 fa 73             	cmp    $0x73,%edx
 5a0:	0f 84 a2 00 00 00    	je     648 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a6:	83 fa 63             	cmp    $0x63,%edx
 5a9:	0f 84 35 01 00 00    	je     6e4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5af:	83 fa 25             	cmp    $0x25,%edx
 5b2:	0f 84 e0 00 00 00    	je     698 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5bb:	83 c3 01             	add    $0x1,%ebx
 5be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5c6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cc:	89 34 24             	mov    %esi,(%esp)
 5cf:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5d2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5d6:	e8 0f fe ff ff       	call   3ea <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5db:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5de:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e8:	00 
 5e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ed:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5f3:	e8 f2 fd ff ff       	call   3ea <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5fc:	84 d2                	test   %dl,%dl
 5fe:	0f 85 76 ff ff ff    	jne    57a <printf+0x5a>
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 608:	83 c4 3c             	add    $0x3c,%esp
 60b:	5b                   	pop    %ebx
 60c:	5e                   	pop    %esi
 60d:	5f                   	pop    %edi
 60e:	5d                   	pop    %ebp
 60f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 610:	bf 25 00 00 00       	mov    $0x25,%edi
 615:	e9 51 ff ff ff       	jmp    56b <printf+0x4b>
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 620:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 628:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 62a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 631:	8b 10                	mov    (%eax),%edx
 633:	89 f0                	mov    %esi,%eax
 635:	e8 46 fe ff ff       	call   480 <printint>
        ap++;
 63a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 63e:	e9 28 ff ff ff       	jmp    56b <printf+0x4b>
 643:	90                   	nop
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 648:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 64b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 64f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 651:	b8 bd 08 00 00       	mov    $0x8bd,%eax
 656:	85 ff                	test   %edi,%edi
 658:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 65b:	0f b6 07             	movzbl (%edi),%eax
 65e:	84 c0                	test   %al,%al
 660:	74 2a                	je     68c <printf+0x16c>
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 668:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 66b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 66e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 671:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 678:	00 
 679:	89 44 24 04          	mov    %eax,0x4(%esp)
 67d:	89 34 24             	mov    %esi,(%esp)
 680:	e8 65 fd ff ff       	call   3ea <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 685:	0f b6 07             	movzbl (%edi),%eax
 688:	84 c0                	test   %al,%al
 68a:	75 dc                	jne    668 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68c:	31 ff                	xor    %edi,%edi
 68e:	e9 d8 fe ff ff       	jmp    56b <printf+0x4b>
 693:	90                   	nop
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 698:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 69d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a4:	00 
 6a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a9:	89 34 24             	mov    %esi,(%esp)
 6ac:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 6b0:	e8 35 fd ff ff       	call   3ea <write>
 6b5:	e9 b1 fe ff ff       	jmp    56b <printf+0x4b>
 6ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c8:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	89 f0                	mov    %esi,%eax
 6d6:	e8 a5 fd ff ff       	call   480 <printint>
        ap++;
 6db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6df:	e9 87 fe ff ff       	jmp    56b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6e7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6e9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6eb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6f2:	00 
 6f3:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6f6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 700:	e8 e5 fc ff ff       	call   3ea <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 705:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 709:	e9 5d fe ff ff       	jmp    56b <printf+0x4b>
 70e:	66 90                	xchg   %ax,%ax

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 80 0b 00 00       	mov    0xb80,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 71e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 720:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 723:	39 d0                	cmp    %edx,%eax
 725:	72 11                	jb     738 <free+0x28>
 727:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 728:	39 c8                	cmp    %ecx,%eax
 72a:	72 04                	jb     730 <free+0x20>
 72c:	39 ca                	cmp    %ecx,%edx
 72e:	72 10                	jb     740 <free+0x30>
 730:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 732:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 734:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 736:	73 f0                	jae    728 <free+0x18>
 738:	39 ca                	cmp    %ecx,%edx
 73a:	72 04                	jb     740 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73c:	39 c8                	cmp    %ecx,%eax
 73e:	72 f0                	jb     730 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 746:	39 cf                	cmp    %ecx,%edi
 748:	74 1e                	je     768 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 74a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74d:	8b 48 04             	mov    0x4(%eax),%ecx
 750:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 753:	39 f2                	cmp    %esi,%edx
 755:	74 28                	je     77f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 757:	89 10                	mov    %edx,(%eax)
  freep = p;
 759:	a3 80 0b 00 00       	mov    %eax,0xb80
}
 75e:	5b                   	pop    %ebx
 75f:	5e                   	pop    %esi
 760:	5f                   	pop    %edi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    
 763:	90                   	nop
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 768:	03 71 04             	add    0x4(%ecx),%esi
 76b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 76e:	8b 08                	mov    (%eax),%ecx
 770:	8b 09                	mov    (%ecx),%ecx
 772:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 775:	8b 48 04             	mov    0x4(%eax),%ecx
 778:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 77b:	39 f2                	cmp    %esi,%edx
 77d:	75 d8                	jne    757 <free+0x47>
    p->s.size += bp->s.size;
 77f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 782:	a3 80 0b 00 00       	mov    %eax,0xb80
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 787:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 79a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 1d 80 0b 00 00    	mov    0xb80,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 48 07             	lea    0x7(%eax),%ecx
 7b5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 7b8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ba:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 7bd:	0f 84 9b 00 00 00    	je     85e <malloc+0xbe>
 7c3:	8b 13                	mov    (%ebx),%edx
 7c5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c8:	39 fe                	cmp    %edi,%esi
 7ca:	76 64                	jbe    830 <malloc+0x90>
 7cc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7d3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7db:	eb 0e                	jmp    7eb <malloc+0x4b>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e2:	8b 78 04             	mov    0x4(%eax),%edi
 7e5:	39 fe                	cmp    %edi,%esi
 7e7:	76 4f                	jbe    838 <malloc+0x98>
 7e9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7eb:	3b 15 80 0b 00 00    	cmp    0xb80,%edx
 7f1:	75 ed                	jne    7e0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7fc:	bf 00 10 00 00       	mov    $0x1000,%edi
 801:	0f 43 fe             	cmovae %esi,%edi
 804:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 807:	89 04 24             	mov    %eax,(%esp)
 80a:	e8 43 fc ff ff       	call   452 <sbrk>
  if(p == (char*)-1)
 80f:	83 f8 ff             	cmp    $0xffffffff,%eax
 812:	74 18                	je     82c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 814:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 817:	83 c0 08             	add    $0x8,%eax
 81a:	89 04 24             	mov    %eax,(%esp)
 81d:	e8 ee fe ff ff       	call   710 <free>
  return freep;
 822:	8b 15 80 0b 00 00    	mov    0xb80,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 828:	85 d2                	test   %edx,%edx
 82a:	75 b4                	jne    7e0 <malloc+0x40>
        return 0;
 82c:	31 c0                	xor    %eax,%eax
 82e:	eb 20                	jmp    850 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 830:	89 d0                	mov    %edx,%eax
 832:	89 da                	mov    %ebx,%edx
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 838:	39 fe                	cmp    %edi,%esi
 83a:	74 1c                	je     858 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 83c:	29 f7                	sub    %esi,%edi
 83e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 841:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 844:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 847:	89 15 80 0b 00 00    	mov    %edx,0xb80
      return (void*)(p + 1);
 84d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 850:	83 c4 1c             	add    $0x1c,%esp
 853:	5b                   	pop    %ebx
 854:	5e                   	pop    %esi
 855:	5f                   	pop    %edi
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 858:	8b 08                	mov    (%eax),%ecx
 85a:	89 0a                	mov    %ecx,(%edx)
 85c:	eb e9                	jmp    847 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 85e:	c7 05 80 0b 00 00 84 	movl   $0xb84,0xb80
 865:	0b 00 00 
    base.s.size = 0;
 868:	ba 84 0b 00 00       	mov    $0xb84,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 86d:	c7 05 84 0b 00 00 84 	movl   $0xb84,0xb84
 874:	0b 00 00 
    base.s.size = 0;
 877:	c7 05 88 0b 00 00 00 	movl   $0x0,0xb88
 87e:	00 00 00 
 881:	e9 46 ff ff ff       	jmp    7cc <malloc+0x2c>
