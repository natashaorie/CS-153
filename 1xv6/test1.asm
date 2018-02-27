
_test1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	
	int exitWait(void);
	int waitPid(void);
	//int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 08 0e 00 	movl   $0xe08,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 cf 08 00 00       	call   8f0 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 04 07 00 00       	call   730 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 30                	je     61 <main+0x61>
	exitWait();
  else if (atoi(argv[1]) == 2)
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 f4 06 00 00       	call   730 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 27                	je     68 <main+0x68>
	waitPid();
  
  else 
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the priority scheduler \n");
  41:	c7 44 24 04 3c 0e 00 	movl   $0xe3c,0x4(%esp)
  48:	00 
  49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  50:	e8 9b 08 00 00       	call   8f0 <printf>
  
    // End of test
	 exit(0);
  55:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  5c:	e8 31 07 00 00       	call   792 <exit>
	//int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1)
	exitWait();
  61:	e8 1a 00 00 00       	call   80 <exitWait>
  66:	eb ed                	jmp    55 <main+0x55>
  68:	90                   	nop
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  else if (atoi(argv[1]) == 2)
	waitPid();
  70:	e8 2b 01 00 00       	call   1a0 <waitPid>
  75:	eb de                	jmp    55 <main+0x55>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <exitWait>:
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	57                   	push   %edi
  84:	56                   	push   %esi
  85:	53                   	push   %ebx
	int pid, ret_pid, exit_status;
	int i;
	
	// use this part to test exit(int status) and wait(int* status)
	printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
	for (i = 0; i < 2; i++) {
  86:	31 db                	xor    %ebx,%ebx
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  88:	83 ec 2c             	sub    $0x2c,%esp
	int pid, ret_pid, exit_status;
	int i;
	
	// use this part to test exit(int status) and wait(int* status)
	printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  8b:	c7 44 24 04 58 0c 00 	movl   $0xc58,0x4(%esp)
  92:	00 
				printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), 1);
				exit(1);
			}
    		}
		else if (pid > 0) { // only the parent exeecutes this code
			ret_pid = wait(&exit_status);
  93:	8d 7d e4             	lea    -0x1c(%ebp),%edi
int exitWait(void) {
	int pid, ret_pid, exit_status;
	int i;
	
	// use this part to test exit(int status) and wait(int* status)
	printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9d:	e8 4e 08 00 00       	call   8f0 <printf>
	for (i = 0; i < 2; i++) {
		pid = fork();
  a2:	e8 e3 06 00 00       	call   78a <fork>
		if (pid == 0) { // only the child executed this code
  a7:	83 f8 00             	cmp    $0x0,%eax
  aa:	74 64                	je     110 <exitWait+0x90>
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			else{
				printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), 1);
				exit(1);
			}
    		}
		else if (pid > 0) { // only the parent exeecutes this code
  b0:	0f 8e c3 00 00 00    	jle    179 <exitWait+0xf9>
			ret_pid = wait(&exit_status);
  b6:	89 3c 24             	mov    %edi,(%esp)
	int pid, ret_pid, exit_status;
	int i;
	
	// use this part to test exit(int status) and wait(int* status)
	printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
	for (i = 0; i < 2; i++) {
  b9:	83 c3 01             	add    $0x1,%ebx
				printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), 1);
				exit(1);
			}
    		}
		else if (pid > 0) { // only the parent exeecutes this code
			ret_pid = wait(&exit_status);
  bc:	e8 d9 06 00 00       	call   79a <wait>
			printf(1, "DEBUG %d %d",ret_pid, exit_status);
  c1:	c7 44 24 04 e8 10 00 	movl   $0x10e8,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
				printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), 1);
				exit(1);
			}
    		}
		else if (pid > 0) { // only the parent exeecutes this code
			ret_pid = wait(&exit_status);
  d0:	89 c6                	mov    %eax,%esi
			printf(1, "DEBUG %d %d",ret_pid, exit_status);
  d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  d5:	89 74 24 08          	mov    %esi,0x8(%esp)
  d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  dd:	e8 0e 08 00 00       	call   8f0 <printf>
			printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  e5:	89 74 24 08          	mov    %esi,0x8(%esp)
  e9:	c7 44 24 04 d0 0c 00 	movl   $0xcd0,0x4(%esp)
  f0:	00 
  f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  fc:	e8 ef 07 00 00       	call   8f0 <printf>
	int pid, ret_pid, exit_status;
	int i;
	
	// use this part to test exit(int status) and wait(int* status)
	printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
	for (i = 0; i < 2; i++) {
 101:	83 fb 02             	cmp    $0x2,%ebx
 104:	75 9c                	jne    a2 <exitWait+0x22>
			printf(2, "\nError using fork\n");
			exit(1);
		}
	}
	return 0;
}
 106:	83 c4 2c             	add    $0x2c,%esp
 109:	31 c0                	xor    %eax,%eax
 10b:	5b                   	pop    %ebx
 10c:	5e                   	pop    %esi
 10d:	5f                   	pop    %edi
 10e:	5d                   	pop    %ebp
 10f:	c3                   	ret    
	// use this part to test exit(int status) and wait(int* status)
	printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
	for (i = 0; i < 2; i++) {
		pid = fork();
		if (pid == 0) { // only the child executed this code
			if (i == 0){
 110:	85 db                	test   %ebx,%ebx
 112:	75 34                	jne    148 <exitWait+0xc8>
				printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 114:	e8 01 07 00 00       	call   81a <getpid>
 119:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 120:	00 
 121:	c7 44 24 04 94 0c 00 	movl   $0xc94,0x4(%esp)
 128:	00 
 129:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	e8 b7 07 00 00       	call   8f0 <printf>
				exit(0);
 139:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 140:	e8 4d 06 00 00       	call   792 <exit>
 145:	8d 76 00             	lea    0x0(%esi),%esi
			}
			else{
				printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), 1);
 148:	e8 cd 06 00 00       	call   81a <getpid>
 14d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 154:	00 
 155:	c7 44 24 04 94 0c 00 	movl   $0xc94,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 164:	89 44 24 08          	mov    %eax,0x8(%esp)
 168:	e8 83 07 00 00       	call   8f0 <printf>
				exit(1);
 16d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 174:	e8 19 06 00 00       	call   792 <exit>
			ret_pid = wait(&exit_status);
			printf(1, "DEBUG %d %d",ret_pid, exit_status);
			printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
		} 
		else { // something went wrong with fork system call  
			printf(2, "\nError using fork\n");
 179:	c7 44 24 04 f4 10 00 	movl   $0x10f4,0x4(%esp)
 180:	00 
 181:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 188:	e8 63 07 00 00       	call   8f0 <printf>
			exit(1);
 18d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 194:	e8 f9 05 00 00       	call   792 <exit>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <waitPid>:
		}
	}
	return 0;
}

int waitPid(void){
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	83 ec 30             	sub    $0x30,%esp
	int ret_pid, exit_status;
	int i;
	int pid_a[5]={0, 0, 0, 0, 0};
	// use this part to test wait(int pid, int* status, int options)

	printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1a8:	c7 44 24 04 14 0d 00 	movl   $0xd14,0x4(%esp)
 1af:	00 
 1b0:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 1b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ba:	8d 75 f8             	lea    -0x8(%ebp),%esi

int waitPid(void){
	
	int ret_pid, exit_status;
	int i;
	int pid_a[5]={0, 0, 0, 0, 0};
 1bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 1cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	// use this part to test wait(int pid, int* status, int options)

	printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1e0:	e8 0b 07 00 00       	call   8f0 <printf>

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();	
 1e5:	e8 a0 05 00 00       	call   78a <fork>
		if (pid_a[i] == 0) { // only the child executed this code
 1ea:	85 c0                	test   %eax,%eax
	// use this part to test wait(int pid, int* status, int options)

	printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();	
 1ec:	89 03                	mov    %eax,(%ebx)
		if (pid_a[i] == 0) { // only the child executed this code
 1ee:	0f 84 f0 01 00 00    	je     3e4 <waitPid+0x244>
 1f4:	83 c3 04             	add    $0x4,%ebx
	int pid_a[5]={0, 0, 0, 0, 0};
	// use this part to test wait(int pid, int* status, int options)

	printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

	for (i = 0; i <5; i++) {
 1f7:	39 f3                	cmp    %esi,%ebx
 1f9:	75 ea                	jne    1e5 <waitPid+0x45>
			printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
			exit(0);
		}
	}
       
	sleep(5);
 1fb:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
	printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
	printf(1, "exit status currently is %d", exit_status);
	ret_pid = waitpid(pid_a[3], &exit_status, 0);
 202:	8d 5d e0             	lea    -0x20(%ebp),%ebx
			printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
			exit(0);
		}
	}
       
	sleep(5);
 205:	e8 28 06 00 00       	call   832 <sleep>
	printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 20a:	8b 75 f0             	mov    -0x10(%ebp),%esi
 20d:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 214:	00 
 215:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21c:	89 74 24 08          	mov    %esi,0x8(%esp)
 220:	e8 cb 06 00 00       	call   8f0 <printf>
	printf(1, "exit status currently is %d", exit_status);
 225:	8b 45 e0             	mov    -0x20(%ebp),%eax
 228:	c7 44 24 04 07 11 00 	movl   $0x1107,0x4(%esp)
 22f:	00 
 230:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 237:	89 44 24 08          	mov    %eax,0x8(%esp)
 23b:	e8 b0 06 00 00       	call   8f0 <printf>
	ret_pid = waitpid(pid_a[3], &exit_status, 0);
 240:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 244:	89 34 24             	mov    %esi,(%esp)
 247:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 24e:	00 
 24f:	e8 4e 05 00 00       	call   7a2 <waitpid>
	printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 254:	8b 55 e0             	mov    -0x20(%ebp),%edx
 257:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
 25e:	00 
 25f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 266:	89 54 24 0c          	mov    %edx,0xc(%esp)
 26a:	89 44 24 08          	mov    %eax,0x8(%esp)
 26e:	e8 7d 06 00 00       	call   8f0 <printf>
	sleep(5);
 273:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 27a:	e8 b3 05 00 00       	call   832 <sleep>
	printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 27f:	8b 75 e8             	mov    -0x18(%ebp),%esi
 282:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 289:	00 
 28a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 291:	89 74 24 08          	mov    %esi,0x8(%esp)
 295:	e8 56 06 00 00       	call   8f0 <printf>
	ret_pid = waitpid(pid_a[1], &exit_status, 0);
 29a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 29e:	89 34 24             	mov    %esi,(%esp)
 2a1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2a8:	00 
 2a9:	e8 f4 04 00 00       	call   7a2 <waitpid>
	printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2ae:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2b1:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
 2b8:	00 
 2b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2c4:	89 44 24 08          	mov    %eax,0x8(%esp)
 2c8:	e8 23 06 00 00       	call   8f0 <printf>
	sleep(5);
 2cd:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2d4:	e8 59 05 00 00       	call   832 <sleep>
      	printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2d9:	8b 75 ec             	mov    -0x14(%ebp),%esi
 2dc:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 2e3:	00 
 2e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2eb:	89 74 24 08          	mov    %esi,0x8(%esp)
 2ef:	e8 fc 05 00 00       	call   8f0 <printf>
      	ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2f4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2f8:	89 34 24             	mov    %esi,(%esp)
 2fb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 302:	00 
 303:	e8 9a 04 00 00       	call   7a2 <waitpid>
      	printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 308:	8b 55 e0             	mov    -0x20(%ebp),%edx
 30b:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
 312:	00 
 313:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 31a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 31e:	89 44 24 08          	mov    %eax,0x8(%esp)
 322:	e8 c9 05 00 00       	call   8f0 <printf>
      	sleep(5);
 327:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 32e:	e8 ff 04 00 00       	call   832 <sleep>
      	printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 333:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 336:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 33d:	00 
 33e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 345:	89 74 24 08          	mov    %esi,0x8(%esp)
 349:	e8 a2 05 00 00       	call   8f0 <printf>
      	ret_pid = waitpid(pid_a[0], &exit_status, 0);
 34e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 352:	89 34 24             	mov    %esi,(%esp)
 355:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 35c:	00 
 35d:	e8 40 04 00 00       	call   7a2 <waitpid>
      	printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 362:	8b 55 e0             	mov    -0x20(%ebp),%edx
 365:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
 36c:	00 
 36d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 374:	89 54 24 0c          	mov    %edx,0xc(%esp)
 378:	89 44 24 08          	mov    %eax,0x8(%esp)
 37c:	e8 6f 05 00 00       	call   8f0 <printf>
      	sleep(5);
 381:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 388:	e8 a5 04 00 00       	call   832 <sleep>
      	printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 38d:	8b 75 f4             	mov    -0xc(%ebp),%esi
 390:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 397:	00 
 398:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 39f:	89 74 24 08          	mov    %esi,0x8(%esp)
 3a3:	e8 48 05 00 00       	call   8f0 <printf>
      	ret_pid = waitpid(pid_a[4], &exit_status, 0);
 3a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3ac:	89 34 24             	mov    %esi,(%esp)
 3af:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 3b6:	00 
 3b7:	e8 e6 03 00 00       	call   7a2 <waitpid>
      	printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 3bc:	8b 55 e0             	mov    -0x20(%ebp),%edx
 3bf:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
 3c6:	00 
 3c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3ce:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3d2:	89 44 24 08          	mov    %eax,0x8(%esp)
 3d6:	e8 15 05 00 00       	call   8f0 <printf>
      
      	return 0;
}
 3db:	83 c4 30             	add    $0x30,%esp
 3de:	31 c0                	xor    %eax,%eax
 3e0:	5b                   	pop    %ebx
 3e1:	5e                   	pop    %esi
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    
	printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();	
		if (pid_a[i] == 0) { // only the child executed this code
			printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 3e4:	e8 31 04 00 00       	call   81a <getpid>
 3e9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 3f0:	00 
 3f1:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 3f8:	00 
 3f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 400:	89 44 24 08          	mov    %eax,0x8(%esp)
 404:	e8 e7 04 00 00       	call   8f0 <printf>
			exit(0);
 409:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 410:	e8 7d 03 00 00       	call   792 <exit>
 415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <PScheduler>:
      
      	return 0;
}
      
      
int PScheduler(void){
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
	    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    	printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    	printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    	printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    	//setpriority(0);
    	for (i = 0; i <  3; i++) {
 425:	31 db                	xor    %ebx,%ebx
      
      	return 0;
}
      
      
int PScheduler(void){
 427:	83 ec 20             	sub    $0x20,%esp
// 0 is the highest priority. All processes have a default priority of 20 

	int pid, ret_pid, exit_status;
	int i,j,k;
  
	    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
 42a:	c7 44 24 04 ac 0e 00 	movl   $0xeac,0x4(%esp)
 431:	00 
 432:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 439:	e8 b2 04 00 00       	call   8f0 <printf>
    	printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
 43e:	c7 44 24 04 04 0f 00 	movl   $0xf04,0x4(%esp)
 445:	00 
 446:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 44d:	e8 9e 04 00 00       	call   8f0 <printf>
    	printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
 452:	c7 44 24 04 54 0f 00 	movl   $0xf54,0x4(%esp)
 459:	00 
 45a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 461:	e8 8a 04 00 00       	call   8f0 <printf>
    	printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
 466:	c7 44 24 04 a8 0f 00 	movl   $0xfa8,0x4(%esp)
 46d:	00 
 46e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 475:	e8 76 04 00 00       	call   8f0 <printf>
    	//setpriority(0);
    	for (i = 0; i <  3; i++) {
		pid = fork();
 47a:	e8 0b 03 00 00       	call   78a <fork>
		if (pid > 0 ) {
 47f:	83 f8 00             	cmp    $0x0,%eax
 482:	7e 59                	jle    4dd <PScheduler+0xbd>
	    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    	printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    	printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    	printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    	//setpriority(0);
    	for (i = 0; i <  3; i++) {
 484:	83 c3 01             	add    $0x1,%ebx
 487:	83 fb 03             	cmp    $0x3,%ebx
 48a:	75 ee                	jne    47a <PScheduler+0x5a>
 48c:	bb 03 00 00 00       	mov    $0x3,%ebx
 491:	8d 75 f4             	lea    -0xc(%ebp),%esi
        	}
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
			ret_pid = wait(&exit_status);
 494:	89 34 24             	mov    %esi,(%esp)
 497:	e8 fe 02 00 00       	call   79a <wait>
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
 49c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 49f:	c7 44 24 04 58 10 00 	movl   $0x1058,0x4(%esp)
 4a6:	00 
 4a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4ae:	89 54 24 0c          	mov    %edx,0xc(%esp)
 4b2:	89 44 24 08          	mov    %eax,0x8(%esp)
 4b6:	e8 35 04 00 00       	call   8f0 <printf>
			exit(1);
        	}
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
 4bb:	83 eb 01             	sub    $0x1,%ebx
 4be:	75 d4                	jne    494 <PScheduler+0x74>
			ret_pid = wait(&exit_status);
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
		}
		printf(1,"\n if processes with highest priority finished first then its correct \n");
 4c0:	c7 44 24 04 a0 10 00 	movl   $0x10a0,0x4(%esp)
 4c7:	00 
 4c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4cf:	e8 1c 04 00 00       	call   8f0 <printf>
	}			
	return 0;
}
 4d4:	83 c4 20             	add    $0x20,%esp
 4d7:	31 c0                	xor    %eax,%eax
 4d9:	5b                   	pop    %ebx
 4da:	5e                   	pop    %esi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
    	for (i = 0; i <  3; i++) {
		pid = fork();
		if (pid > 0 ) {
			continue;
		}
		else if ( pid == 0) {
 4dd:	75 71                	jne    550 <PScheduler+0x130>
			printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
 4df:	e8 36 03 00 00       	call   81a <getpid>
 4e4:	6b db ec             	imul   $0xffffffec,%ebx,%ebx
 4e7:	c7 44 24 04 e4 0f 00 	movl   $0xfe4,0x4(%esp)
 4ee:	00 
 4ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4f6:	83 c3 3c             	add    $0x3c,%ebx
 4f9:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 4fd:	89 44 24 08          	mov    %eax,0x8(%esp)
 501:	e8 ea 03 00 00       	call   8f0 <printf>
 506:	ba 50 c3 00 00       	mov    $0xc350,%edx
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    	printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    	printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    	printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    	//setpriority(0);
    	for (i = 0; i <  3; i++) {
 510:	b8 10 27 00 00       	mov    $0x2710,%eax
 515:	8d 76 00             	lea    0x0(%esi),%esi
		else if ( pid == 0) {
			printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
			//setpriority(60-20*i);	
			for (j=0;j<50000;j++) {
				for(k=0;k<10000;k++) {
					asm("nop"); 
 518:	90                   	nop
		}
		else if ( pid == 0) {
			printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
			//setpriority(60-20*i);	
			for (j=0;j<50000;j++) {
				for(k=0;k<10000;k++) {
 519:	83 e8 01             	sub    $0x1,%eax
 51c:	75 fa                	jne    518 <PScheduler+0xf8>
			continue;
		}
		else if ( pid == 0) {
			printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
			//setpriority(60-20*i);	
			for (j=0;j<50000;j++) {
 51e:	83 ea 01             	sub    $0x1,%edx
 521:	75 ed                	jne    510 <PScheduler+0xf0>
				for(k=0;k<10000;k++) {
					asm("nop"); 
				}
			}
			printf(1, "\n child# %d with priority %d has finished! \n",getpid(),60-20*i);		
 523:	e8 f2 02 00 00       	call   81a <getpid>
 528:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 52c:	c7 44 24 04 28 10 00 	movl   $0x1028,0x4(%esp)
 533:	00 
 534:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 53b:	89 44 24 08          	mov    %eax,0x8(%esp)
 53f:	e8 ac 03 00 00       	call   8f0 <printf>
			exit(0);
 544:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 54b:	e8 42 02 00 00       	call   792 <exit>
        	}
        	else {
			printf(2," \n Error \n");
 550:	c7 44 24 04 23 11 00 	movl   $0x1123,0x4(%esp)
 557:	00 
 558:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 55f:	e8 8c 03 00 00       	call   8f0 <printf>
			exit(1);
 564:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 56b:	e8 22 02 00 00       	call   792 <exit>

00000570 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 579:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 57a:	89 c2                	mov    %eax,%edx
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 580:	83 c1 01             	add    $0x1,%ecx
 583:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 587:	83 c2 01             	add    $0x1,%edx
 58a:	84 db                	test   %bl,%bl
 58c:	88 5a ff             	mov    %bl,-0x1(%edx)
 58f:	75 ef                	jne    580 <strcpy+0x10>
    ;
  return os;
}
 591:	5b                   	pop    %ebx
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 59a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	8b 55 08             	mov    0x8(%ebp),%edx
 5a6:	53                   	push   %ebx
 5a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 5aa:	0f b6 02             	movzbl (%edx),%eax
 5ad:	84 c0                	test   %al,%al
 5af:	74 2d                	je     5de <strcmp+0x3e>
 5b1:	0f b6 19             	movzbl (%ecx),%ebx
 5b4:	38 d8                	cmp    %bl,%al
 5b6:	74 0e                	je     5c6 <strcmp+0x26>
 5b8:	eb 2b                	jmp    5e5 <strcmp+0x45>
 5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5c0:	38 c8                	cmp    %cl,%al
 5c2:	75 15                	jne    5d9 <strcmp+0x39>
    p++, q++;
 5c4:	89 d9                	mov    %ebx,%ecx
 5c6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 5c9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 5cc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 5cf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 5d3:	84 c0                	test   %al,%al
 5d5:	75 e9                	jne    5c0 <strcmp+0x20>
 5d7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 5d9:	29 c8                	sub    %ecx,%eax
}
 5db:	5b                   	pop    %ebx
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    
 5de:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 5e1:	31 c0                	xor    %eax,%eax
 5e3:	eb f4                	jmp    5d9 <strcmp+0x39>
 5e5:	0f b6 cb             	movzbl %bl,%ecx
 5e8:	eb ef                	jmp    5d9 <strcmp+0x39>
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005f0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5f6:	80 39 00             	cmpb   $0x0,(%ecx)
 5f9:	74 12                	je     60d <strlen+0x1d>
 5fb:	31 d2                	xor    %edx,%edx
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
 600:	83 c2 01             	add    $0x1,%edx
 603:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 607:	89 d0                	mov    %edx,%eax
 609:	75 f5                	jne    600 <strlen+0x10>
    ;
  return n;
}
 60b:	5d                   	pop    %ebp
 60c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 60d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret    
 611:	eb 0d                	jmp    620 <memset>
 613:	90                   	nop
 614:	90                   	nop
 615:	90                   	nop
 616:	90                   	nop
 617:	90                   	nop
 618:	90                   	nop
 619:	90                   	nop
 61a:	90                   	nop
 61b:	90                   	nop
 61c:	90                   	nop
 61d:	90                   	nop
 61e:	90                   	nop
 61f:	90                   	nop

00000620 <memset>:

void*
memset(void *dst, int c, uint n)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	8b 55 08             	mov    0x8(%ebp),%edx
 626:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 627:	8b 4d 10             	mov    0x10(%ebp),%ecx
 62a:	8b 45 0c             	mov    0xc(%ebp),%eax
 62d:	89 d7                	mov    %edx,%edi
 62f:	fc                   	cld    
 630:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 632:	89 d0                	mov    %edx,%eax
 634:	5f                   	pop    %edi
 635:	5d                   	pop    %ebp
 636:	c3                   	ret    
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <strchr>:

char*
strchr(const char *s, char c)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	53                   	push   %ebx
 647:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 64a:	0f b6 18             	movzbl (%eax),%ebx
 64d:	84 db                	test   %bl,%bl
 64f:	74 1d                	je     66e <strchr+0x2e>
    if(*s == c)
 651:	38 d3                	cmp    %dl,%bl
 653:	89 d1                	mov    %edx,%ecx
 655:	75 0d                	jne    664 <strchr+0x24>
 657:	eb 17                	jmp    670 <strchr+0x30>
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 660:	38 ca                	cmp    %cl,%dl
 662:	74 0c                	je     670 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 664:	83 c0 01             	add    $0x1,%eax
 667:	0f b6 10             	movzbl (%eax),%edx
 66a:	84 d2                	test   %dl,%dl
 66c:	75 f2                	jne    660 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 66e:	31 c0                	xor    %eax,%eax
}
 670:	5b                   	pop    %ebx
 671:	5d                   	pop    %ebp
 672:	c3                   	ret    
 673:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000680 <gets>:

char*
gets(char *buf, int max)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 685:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 687:	53                   	push   %ebx
 688:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 68b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 68e:	eb 31                	jmp    6c1 <gets+0x41>
    cc = read(0, &c, 1);
 690:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 697:	00 
 698:	89 7c 24 04          	mov    %edi,0x4(%esp)
 69c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6a3:	e8 0a 01 00 00       	call   7b2 <read>
    if(cc < 1)
 6a8:	85 c0                	test   %eax,%eax
 6aa:	7e 1d                	jle    6c9 <gets+0x49>
      break;
    buf[i++] = c;
 6ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6b0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 6b2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 6b5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 6b7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 6bb:	74 0c                	je     6c9 <gets+0x49>
 6bd:	3c 0a                	cmp    $0xa,%al
 6bf:	74 08                	je     6c9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6c1:	8d 5e 01             	lea    0x1(%esi),%ebx
 6c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6c7:	7c c7                	jl     690 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
 6cc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6d0:	83 c4 2c             	add    $0x2c,%esp
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	90                   	nop
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006e0 <stat>:

int
stat(char *n, struct stat *st)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	56                   	push   %esi
 6e4:	53                   	push   %ebx
 6e5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 6f2:	00 
 6f3:	89 04 24             	mov    %eax,(%esp)
 6f6:	e8 df 00 00 00       	call   7da <open>
  if(fd < 0)
 6fb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6fd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 6ff:	78 27                	js     728 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 701:	8b 45 0c             	mov    0xc(%ebp),%eax
 704:	89 1c 24             	mov    %ebx,(%esp)
 707:	89 44 24 04          	mov    %eax,0x4(%esp)
 70b:	e8 e2 00 00 00       	call   7f2 <fstat>
  close(fd);
 710:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 713:	89 c6                	mov    %eax,%esi
  close(fd);
 715:	e8 a8 00 00 00       	call   7c2 <close>
  return r;
 71a:	89 f0                	mov    %esi,%eax
}
 71c:	83 c4 10             	add    $0x10,%esp
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5d                   	pop    %ebp
 722:	c3                   	ret    
 723:	90                   	nop
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 72d:	eb ed                	jmp    71c <stat+0x3c>
 72f:	90                   	nop

00000730 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	8b 4d 08             	mov    0x8(%ebp),%ecx
 736:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 737:	0f be 11             	movsbl (%ecx),%edx
 73a:	8d 42 d0             	lea    -0x30(%edx),%eax
 73d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 73f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 744:	77 17                	ja     75d <atoi+0x2d>
 746:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 748:	83 c1 01             	add    $0x1,%ecx
 74b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 74e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 752:	0f be 11             	movsbl (%ecx),%edx
 755:	8d 5a d0             	lea    -0x30(%edx),%ebx
 758:	80 fb 09             	cmp    $0x9,%bl
 75b:	76 eb                	jbe    748 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 75d:	5b                   	pop    %ebx
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    

00000760 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 760:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 761:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 763:	89 e5                	mov    %esp,%ebp
 765:	56                   	push   %esi
 766:	8b 45 08             	mov    0x8(%ebp),%eax
 769:	53                   	push   %ebx
 76a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 76d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 770:	85 db                	test   %ebx,%ebx
 772:	7e 12                	jle    786 <memmove+0x26>
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 778:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 77c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 77f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 782:	39 da                	cmp    %ebx,%edx
 784:	75 f2                	jne    778 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 786:	5b                   	pop    %ebx
 787:	5e                   	pop    %esi
 788:	5d                   	pop    %ebp
 789:	c3                   	ret    

0000078a <fork>:
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret


SYSCALL(fork)
 78a:	b8 01 00 00 00       	mov    $0x1,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <exit>:
SYSCALL(exit)
 792:	b8 02 00 00 00       	mov    $0x2,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <wait>:
SYSCALL(wait)
 79a:	b8 03 00 00 00       	mov    $0x3,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <waitpid>:
SYSCALL(waitpid)
 7a2:	b8 16 00 00 00       	mov    $0x16,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <pipe>:
SYSCALL(pipe)
 7aa:	b8 04 00 00 00       	mov    $0x4,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <read>:
SYSCALL(read)
 7b2:	b8 05 00 00 00       	mov    $0x5,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <write>:
SYSCALL(write)
 7ba:	b8 10 00 00 00       	mov    $0x10,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <close>:
SYSCALL(close)
 7c2:	b8 15 00 00 00       	mov    $0x15,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <kill>:
SYSCALL(kill)
 7ca:	b8 06 00 00 00       	mov    $0x6,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <exec>:
SYSCALL(exec)
 7d2:	b8 07 00 00 00       	mov    $0x7,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <open>:
SYSCALL(open)
 7da:	b8 0f 00 00 00       	mov    $0xf,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <mknod>:
SYSCALL(mknod)
 7e2:	b8 11 00 00 00       	mov    $0x11,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <unlink>:
SYSCALL(unlink)
 7ea:	b8 12 00 00 00       	mov    $0x12,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <fstat>:
SYSCALL(fstat)
 7f2:	b8 08 00 00 00       	mov    $0x8,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <link>:
SYSCALL(link)
 7fa:	b8 13 00 00 00       	mov    $0x13,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <mkdir>:
SYSCALL(mkdir)
 802:	b8 14 00 00 00       	mov    $0x14,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <chdir>:
SYSCALL(chdir)
 80a:	b8 09 00 00 00       	mov    $0x9,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    

00000812 <dup>:
SYSCALL(dup)
 812:	b8 0a 00 00 00       	mov    $0xa,%eax
 817:	cd 40                	int    $0x40
 819:	c3                   	ret    

0000081a <getpid>:
SYSCALL(getpid)
 81a:	b8 0b 00 00 00       	mov    $0xb,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <sbrk>:
SYSCALL(sbrk)
 822:	b8 0c 00 00 00       	mov    $0xc,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <setprior>:
SYSCALL(setprior)
 82a:	b8 17 00 00 00       	mov    $0x17,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <sleep>:
SYSCALL(sleep)
 832:	b8 0d 00 00 00       	mov    $0xd,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    

0000083a <uptime>:
SYSCALL(uptime)
 83a:	b8 0e 00 00 00       	mov    $0xe,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    
 842:	66 90                	xchg   %ax,%ax
 844:	66 90                	xchg   %ax,%ax
 846:	66 90                	xchg   %ax,%ax
 848:	66 90                	xchg   %ax,%ax
 84a:	66 90                	xchg   %ax,%ax
 84c:	66 90                	xchg   %ax,%ax
 84e:	66 90                	xchg   %ax,%ax

00000850 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	89 c6                	mov    %eax,%esi
 857:	53                   	push   %ebx
 858:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 85b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 85e:	85 db                	test   %ebx,%ebx
 860:	74 09                	je     86b <printint+0x1b>
 862:	89 d0                	mov    %edx,%eax
 864:	c1 e8 1f             	shr    $0x1f,%eax
 867:	84 c0                	test   %al,%al
 869:	75 75                	jne    8e0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 86b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 86d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 874:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 877:	31 ff                	xor    %edi,%edi
 879:	89 ce                	mov    %ecx,%esi
 87b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 87e:	eb 02                	jmp    882 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 880:	89 cf                	mov    %ecx,%edi
 882:	31 d2                	xor    %edx,%edx
 884:	f7 f6                	div    %esi
 886:	8d 4f 01             	lea    0x1(%edi),%ecx
 889:	0f b6 92 35 11 00 00 	movzbl 0x1135(%edx),%edx
  }while((x /= base) != 0);
 890:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 892:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 895:	75 e9                	jne    880 <printint+0x30>
  if(neg)
 897:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 89a:	89 c8                	mov    %ecx,%eax
 89c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 89f:	85 d2                	test   %edx,%edx
 8a1:	74 08                	je     8ab <printint+0x5b>
    buf[i++] = '-';
 8a3:	8d 4f 02             	lea    0x2(%edi),%ecx
 8a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 8ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
 8ae:	66 90                	xchg   %ax,%ax
 8b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 8b5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8bf:	00 
 8c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8c4:	89 34 24             	mov    %esi,(%esp)
 8c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 8ca:	e8 eb fe ff ff       	call   7ba <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 8cf:	83 ff ff             	cmp    $0xffffffff,%edi
 8d2:	75 dc                	jne    8b0 <printint+0x60>
    putc(fd, buf[i]);
}
 8d4:	83 c4 4c             	add    $0x4c,%esp
 8d7:	5b                   	pop    %ebx
 8d8:	5e                   	pop    %esi
 8d9:	5f                   	pop    %edi
 8da:	5d                   	pop    %ebp
 8db:	c3                   	ret    
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 8e0:	89 d0                	mov    %edx,%eax
 8e2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 8e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 8eb:	eb 87                	jmp    874 <printint+0x24>
 8ed:	8d 76 00             	lea    0x0(%esi),%esi

000008f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8f4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8f6:	56                   	push   %esi
 8f7:	53                   	push   %ebx
 8f8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 8fe:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 901:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 904:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 907:	0f b6 13             	movzbl (%ebx),%edx
 90a:	83 c3 01             	add    $0x1,%ebx
 90d:	84 d2                	test   %dl,%dl
 90f:	75 39                	jne    94a <printf+0x5a>
 911:	e9 c2 00 00 00       	jmp    9d8 <printf+0xe8>
 916:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 918:	83 fa 25             	cmp    $0x25,%edx
 91b:	0f 84 bf 00 00 00    	je     9e0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 921:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 924:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 92b:	00 
 92c:	89 44 24 04          	mov    %eax,0x4(%esp)
 930:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 933:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 936:	e8 7f fe ff ff       	call   7ba <write>
 93b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 93e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 942:	84 d2                	test   %dl,%dl
 944:	0f 84 8e 00 00 00    	je     9d8 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 94a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 94c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 94f:	74 c7                	je     918 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 951:	83 ff 25             	cmp    $0x25,%edi
 954:	75 e5                	jne    93b <printf+0x4b>
      if(c == 'd'){
 956:	83 fa 64             	cmp    $0x64,%edx
 959:	0f 84 31 01 00 00    	je     a90 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 95f:	25 f7 00 00 00       	and    $0xf7,%eax
 964:	83 f8 70             	cmp    $0x70,%eax
 967:	0f 84 83 00 00 00    	je     9f0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 96d:	83 fa 73             	cmp    $0x73,%edx
 970:	0f 84 a2 00 00 00    	je     a18 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 976:	83 fa 63             	cmp    $0x63,%edx
 979:	0f 84 35 01 00 00    	je     ab4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 97f:	83 fa 25             	cmp    $0x25,%edx
 982:	0f 84 e0 00 00 00    	je     a68 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 988:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 98b:	83 c3 01             	add    $0x1,%ebx
 98e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 995:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 996:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 998:	89 44 24 04          	mov    %eax,0x4(%esp)
 99c:	89 34 24             	mov    %esi,(%esp)
 99f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 9a2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 9a6:	e8 0f fe ff ff       	call   7ba <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9b8:	00 
 9b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9bd:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 9c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9c3:	e8 f2 fd ff ff       	call   7ba <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9c8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 9cc:	84 d2                	test   %dl,%dl
 9ce:	0f 85 76 ff ff ff    	jne    94a <printf+0x5a>
 9d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9d8:	83 c4 3c             	add    $0x3c,%esp
 9db:	5b                   	pop    %ebx
 9dc:	5e                   	pop    %esi
 9dd:	5f                   	pop    %edi
 9de:	5d                   	pop    %ebp
 9df:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9e0:	bf 25 00 00 00       	mov    $0x25,%edi
 9e5:	e9 51 ff ff ff       	jmp    93b <printf+0x4b>
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9f3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9f8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 a01:	8b 10                	mov    (%eax),%edx
 a03:	89 f0                	mov    %esi,%eax
 a05:	e8 46 fe ff ff       	call   850 <printint>
        ap++;
 a0a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a0e:	e9 28 ff ff ff       	jmp    93b <printf+0x4b>
 a13:	90                   	nop
 a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 a18:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 a1b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 a1f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 a21:	b8 2e 11 00 00       	mov    $0x112e,%eax
 a26:	85 ff                	test   %edi,%edi
 a28:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 a2b:	0f b6 07             	movzbl (%edi),%eax
 a2e:	84 c0                	test   %al,%al
 a30:	74 2a                	je     a5c <printf+0x16c>
 a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a38:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a3b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 a3e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a41:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a48:	00 
 a49:	89 44 24 04          	mov    %eax,0x4(%esp)
 a4d:	89 34 24             	mov    %esi,(%esp)
 a50:	e8 65 fd ff ff       	call   7ba <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a55:	0f b6 07             	movzbl (%edi),%eax
 a58:	84 c0                	test   %al,%al
 a5a:	75 dc                	jne    a38 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a5c:	31 ff                	xor    %edi,%edi
 a5e:	e9 d8 fe ff ff       	jmp    93b <printf+0x4b>
 a63:	90                   	nop
 a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a68:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a6b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a6d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a74:	00 
 a75:	89 44 24 04          	mov    %eax,0x4(%esp)
 a79:	89 34 24             	mov    %esi,(%esp)
 a7c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 a80:	e8 35 fd ff ff       	call   7ba <write>
 a85:	e9 b1 fe ff ff       	jmp    93b <printf+0x4b>
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a90:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a93:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a98:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aa2:	8b 10                	mov    (%eax),%edx
 aa4:	89 f0                	mov    %esi,%eax
 aa6:	e8 a5 fd ff ff       	call   850 <printint>
        ap++;
 aab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 aaf:	e9 87 fe ff ff       	jmp    93b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 ab4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 ab7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 ab9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 abb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 ac2:	00 
 ac3:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 ac6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 ac9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 acc:	89 44 24 04          	mov    %eax,0x4(%esp)
 ad0:	e8 e5 fc ff ff       	call   7ba <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 ad5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 ad9:	e9 5d fe ff ff       	jmp    93b <printf+0x4b>
 ade:	66 90                	xchg   %ax,%ax

00000ae0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ae0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ae1:	a1 34 14 00 00       	mov    0x1434,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 ae6:	89 e5                	mov    %esp,%ebp
 ae8:	57                   	push   %edi
 ae9:	56                   	push   %esi
 aea:	53                   	push   %ebx
 aeb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aee:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 af0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af3:	39 d0                	cmp    %edx,%eax
 af5:	72 11                	jb     b08 <free+0x28>
 af7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 af8:	39 c8                	cmp    %ecx,%eax
 afa:	72 04                	jb     b00 <free+0x20>
 afc:	39 ca                	cmp    %ecx,%edx
 afe:	72 10                	jb     b10 <free+0x30>
 b00:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b02:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b04:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b06:	73 f0                	jae    af8 <free+0x18>
 b08:	39 ca                	cmp    %ecx,%edx
 b0a:	72 04                	jb     b10 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b0c:	39 c8                	cmp    %ecx,%eax
 b0e:	72 f0                	jb     b00 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b10:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b13:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 b16:	39 cf                	cmp    %ecx,%edi
 b18:	74 1e                	je     b38 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b1a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b1d:	8b 48 04             	mov    0x4(%eax),%ecx
 b20:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b23:	39 f2                	cmp    %esi,%edx
 b25:	74 28                	je     b4f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b27:	89 10                	mov    %edx,(%eax)
  freep = p;
 b29:	a3 34 14 00 00       	mov    %eax,0x1434
}
 b2e:	5b                   	pop    %ebx
 b2f:	5e                   	pop    %esi
 b30:	5f                   	pop    %edi
 b31:	5d                   	pop    %ebp
 b32:	c3                   	ret    
 b33:	90                   	nop
 b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 b38:	03 71 04             	add    0x4(%ecx),%esi
 b3b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b3e:	8b 08                	mov    (%eax),%ecx
 b40:	8b 09                	mov    (%ecx),%ecx
 b42:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 b45:	8b 48 04             	mov    0x4(%eax),%ecx
 b48:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b4b:	39 f2                	cmp    %esi,%edx
 b4d:	75 d8                	jne    b27 <free+0x47>
    p->s.size += bp->s.size;
 b4f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b52:	a3 34 14 00 00       	mov    %eax,0x1434
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 b57:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b5a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b5d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 b5f:	5b                   	pop    %ebx
 b60:	5e                   	pop    %esi
 b61:	5f                   	pop    %edi
 b62:	5d                   	pop    %ebp
 b63:	c3                   	ret    
 b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
 b73:	57                   	push   %edi
 b74:	56                   	push   %esi
 b75:	53                   	push   %ebx
 b76:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b79:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b7c:	8b 1d 34 14 00 00    	mov    0x1434,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b82:	8d 48 07             	lea    0x7(%eax),%ecx
 b85:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 b88:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b8a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 b8d:	0f 84 9b 00 00 00    	je     c2e <malloc+0xbe>
 b93:	8b 13                	mov    (%ebx),%edx
 b95:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b98:	39 fe                	cmp    %edi,%esi
 b9a:	76 64                	jbe    c00 <malloc+0x90>
 b9c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ba3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 ba8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 bab:	eb 0e                	jmp    bbb <malloc+0x4b>
 bad:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bb0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 bb2:	8b 78 04             	mov    0x4(%eax),%edi
 bb5:	39 fe                	cmp    %edi,%esi
 bb7:	76 4f                	jbe    c08 <malloc+0x98>
 bb9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bbb:	3b 15 34 14 00 00    	cmp    0x1434,%edx
 bc1:	75 ed                	jne    bb0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 bc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 bc6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 bcc:	bf 00 10 00 00       	mov    $0x1000,%edi
 bd1:	0f 43 fe             	cmovae %esi,%edi
 bd4:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 bd7:	89 04 24             	mov    %eax,(%esp)
 bda:	e8 43 fc ff ff       	call   822 <sbrk>
  if(p == (char*)-1)
 bdf:	83 f8 ff             	cmp    $0xffffffff,%eax
 be2:	74 18                	je     bfc <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 be4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 be7:	83 c0 08             	add    $0x8,%eax
 bea:	89 04 24             	mov    %eax,(%esp)
 bed:	e8 ee fe ff ff       	call   ae0 <free>
  return freep;
 bf2:	8b 15 34 14 00 00    	mov    0x1434,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 bf8:	85 d2                	test   %edx,%edx
 bfa:	75 b4                	jne    bb0 <malloc+0x40>
        return 0;
 bfc:	31 c0                	xor    %eax,%eax
 bfe:	eb 20                	jmp    c20 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 c00:	89 d0                	mov    %edx,%eax
 c02:	89 da                	mov    %ebx,%edx
 c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c08:	39 fe                	cmp    %edi,%esi
 c0a:	74 1c                	je     c28 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 c0c:	29 f7                	sub    %esi,%edi
 c0e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 c11:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 c14:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 c17:	89 15 34 14 00 00    	mov    %edx,0x1434
      return (void*)(p + 1);
 c1d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 c20:	83 c4 1c             	add    $0x1c,%esp
 c23:	5b                   	pop    %ebx
 c24:	5e                   	pop    %esi
 c25:	5f                   	pop    %edi
 c26:	5d                   	pop    %ebp
 c27:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c28:	8b 08                	mov    (%eax),%ecx
 c2a:	89 0a                	mov    %ecx,(%edx)
 c2c:	eb e9                	jmp    c17 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c2e:	c7 05 34 14 00 00 38 	movl   $0x1438,0x1434
 c35:	14 00 00 
    base.s.size = 0;
 c38:	ba 38 14 00 00       	mov    $0x1438,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c3d:	c7 05 38 14 00 00 38 	movl   $0x1438,0x1438
 c44:	14 00 00 
    base.s.size = 0;
 c47:	c7 05 3c 14 00 00 00 	movl   $0x0,0x143c
 c4e:	00 00 00 
 c51:	e9 46 ff ff ff       	jmp    b9c <malloc+0x2c>
