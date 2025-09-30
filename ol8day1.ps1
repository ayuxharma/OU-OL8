Oracle Linux - 8 (day 1)

OS - Operating System
-----------------------
 |-> System Software - program
 |-> resource management 
 |-> Core part is Kernel
 |-> Interface between user(App) and H/w

 +-----------------------+
 | User: App
 +-----------------------+
 | OS - Kernel
 +-----------------------+
 | H/w 
 +-----------------------+


os --> H/W specific Os 

Vision: portable OS
AT&T 
-----
1950..

asm ->pdp ->...1969 -->BCPL - B ==>B+ --->arch -->Unix OS
				   ---//C        1971/72
GNUProject - 1983 
-----------
minix 
Kernel - Linux -->GNUProject => GNULinux - 1991

Distributors - distro
-------------------------
 ->RedHat + utilities + Linux(Kernel) = RedHat Linux OS
 ->Debian + utilities + Linux(Kernel) = Debian Linux OS
 ->Oracle + utilities + Linux(Kernel) = Oracle Linux OS
 ->Ubuntu + utilities + Linux(Kernel) = Ubuntu Linux OS
 ..

Install webserver on RedHat/Oracle => dnf install httpd
		     Ubuntu => apt install apache2 

------------------------------------------------------------
Kernel - File,Process 

File - data - under the storage
			=======  
Process - data - under the CPU
			   ===
 
---------------------------------------------------------

 +-----------------------+
 | User: App
 +----------|---//SHELL--+
 | OS - Kernel
 +-----------------------+
 | H/w 
 +-----------------------+

shell - interface between user and kernel 
Types of shell
-----------------
1. BourneShell( sh )
2. KornShell (ksh)
3. CShell (csh)
|
4. BourneAgainShell(BASH) - GNUProject 
  BASH - default shell in Linux 
---------------------------------------
To get list of available shells from working linux 

cat  /etc/shells 

How to identify current working shell (or)active shell name?
 ps (or) echo $0

$0 <== variable 
---------------------------------------------------

root@host~]#  <command>
-------------  =========
 |->primary prompt

root@host~]# echo "Hello" ->Hello <== shell script
             print("Hello") ->Hello <== python program
	     cout<<"Hello" ->Hello <== C++
	     printf("Hello") ->Hello <== C
	     puts("Hello") -->Hello <== ruby
	     system.out.println("Hello") -->Hello <== java
	---------------------------------
		write(FD,"Hello") ->newFD
		-----------------
		
 +-----------------------+
 | User: App
 +----------|---//SHELL--+
 |    systemcall() ->File Descriptor(FD)
 
       FD - STDIN-0 ; STDOUT - 1; STDERR - 2
        memory related call -> 0x1235
	FD = 3 to 2 pow 32/64 ->Valid Call
	FD = -1 <== FailedCall

strace <command> - to see the list of systemcalls used in <command>
----------------

 +-----------------------+
 | H/w 
 +-----------------------+


 +-----------------------+
 | User: App
 +----------|---//SHELL--------------------------+
 | 	systemcall() ->FD
 |	|		   ________________________
 |     FileSystem <--> PCB | IPC;SCHED;Memory;Net |
 |	 |		   ------------------------
 |	 |
 |     Device Driver
 |	 |
 |     Device Controller (or) H/w Controller
 +-------|-----------------------------------------+
 | H/w 
 +-----------------------+
=================================================================
login : oracle
password: oracle
|
oracle@gateway~]$ 
--------------------//primary prompt

oracle@gateway~]$ uname
oracle@gateway~]$ uname -r
oracle@gateway~]$ uname -a
oracle@gateway~]$ cat /etc/oracle-release 

oracle@gateway~]$ whoami
oracle@gateway~]$ hostname
oracle@gateway~]$ ip addr (or) ip a

oracle@gateway~]$ df
oracle@gateway~]$ df -h

/dev/xvd[abc][1234]
     ---
      |-->virtual disk

/dev/sd[abc][1234]
     --
      |->real disk - scsi type 

/dev/mapper/...
	|->LVM Partition 

oracle@gateway~]$ df -T <== type of filesystem 

Linux install
--------------
3 partitions are required partitions
---------------------------------------
 1. boot partition
 2. root partition
 3. swap partition
 ===================//required partition

boot partition - boot loader details 
root partition - like MyComputer 
swap partition <== not visible in df -Th command
--------------
   |-> when primary memory is insufficient space 
       os will use swap space 

df -Th

/dev/xvd <== virtual disk
     xvda
	|<-- virtual disk1
     xvda1
	 |<-- virtual disk partition-1

/dev/xvda1				/boot
/dev/xvda2				/
/dev/xvda3

oracle@gateway~]$ lsblk

Linux support 4 primary partitions
-------------------------------------
Linux - personal use
-----------------------
/	<== Required
/boot	<== Required
swap	<== Required
+
/var <==   (optional)
  |--------log files
  |--------mails
  |--------web 

Linux - Server purpose 
------------------------

	+----------------------+
	|  Linux - 10.20.30.40 |
	+----------------------+
/	<== Required
/boot	<== Required
swap	<== Required
+
/home   <== (optional)
  /user1

/home/user1
/home/user2
/home/user3
..
/home/user20

Linux login users
--------------------
 |-> root 	=> /root
 |-> non-root   => /home/non-root

 Login: oracle
 password:
 |
 oracle@gateway~]$ pwd
 /home/oracle

=====================================================================

+-----------+
| host01    |
|10.20.30.40|
+-----------+
 |
root@host01~]# cp p1.log p2.log
		  ------ =======
root@host01~]# cp -r demo sample1
		     ---- =======


+-----------+			 +------------+
| host01    |			 | host02     |
|10.20.30.40|  <====network====> | 10.25.32.11|
+-----------+			 +------------+
 |					|
ping host02				ping host01
.. OK					..OK
----------------
cat /etc/hosts

# remote node details
IPAddress 	FQDN 			alias
10.25.32.11	host02.example.com	host02
----------------
ftp,ssh,telnet 
|
sftp 
root@host01~]# scp p1.log host02:/root/p2.log


root@host01~]# scp -r demo host02:/root/sample1
		     ----  =======
root@host01~]# ssh <remoteHost> {Enter}
...
...
root@<remoteHost>~]# 

oracle@gateway~]$ hostname ->gateway
		  |
		cat /etc/hosts
host03 ..
			
oracle@gateway~]$ ssh root@host03 {Enter}
password:oracle{Enter}
|
root@host03~]# hostname -->host03
root@host03~]#
root@host03~]# working kernel name,version and distribution details
	       ipaddress - ip a
	       echo $0 ; version
	       mounted filesystem details -> df
	       lsblk 
		-----------------------------
root@host03~]# exit
|
oracle@gateway~]$ cd {Enter} 

oracle@gateway~]$ pwd
/home/oracle

oracle@gateway~]$ ls {Enter}

oracle@gateway~]$ ls -a {Enter}

.Filename - hidden file
oracle@gateway~]$ cd .ssh {Enter}
known_hosts 
oracle@gateway .ssh]$ pwd
/home/oracle/.ssh
|
oracle@gateway .ssh]$ cat known_hosts
host02 ...
host01 ...
------------------

oracle@gateway ~]$ ssh host02  Vs oracle@gateway~]$ ssh host03{enter}
Enter a password:		   ....... (yes/no)
					     |
					Enter a password:..
				    root@host03~]# ..
				    root@host03~]# exit

oracle@gateway~]$ cat ./ssh/known_hosts
host02
host01
host03
oracle@gateway~]$ ssh host03{enter}
Enter a password:

oracle@gateway~]$ cd {Enter}
oracle@gateway~]$ pwd {Enter}
/home/oracle
oracle@gateway~]$  uname -rs {Enter}
|
oracle@gateway~]$ uname -rs >>sysinfo.log
	          hostname >>sysinfo.log
                  
oracle@gateway~]$ copy this sysinfo.log file to host03 

oracle@gateway~]$ scp sysinfo.log host03:/tmp {Enter}
Enter a password: oracle

oracle@gateway~]$ ssh host03
Enter a password:

root@host03~]# ls /tmp
sysinfo.log
root@host03~]# cat /tmp/sysinfo.log

root@host03~]# exit
|
oracle@gateway~]$ ls .ssh {Enter}
known_hosts

oracle@gateway~]$ ssh-keygen -t rsa {Enter}
			
	..	{Enter}
		{Enter}

oracle@gateway~]$ ls .ssh {Enter}
id_rsa  <== privateKey
id_rsa.pub <== publicKey
known_hosts <== list of remote node details


oracle@gateway~]$ scp sysinfo.log oracle@host03:/home/oracle {Enter}
Enter a password: <oracle>
oracle@host03~]$ exit
|
oracle@gateway~]$ scp .ssh/id_rsa.pub oracle@host03:/home/oracle/.ssh/authorized_keys
				-----------------

oracle@gateway~]$ ssh oracle@host03 {Enter}

oracle@host03~]$



####################################################################

Bootloader
-----------
OFF ->SwitchON_PC ->POST ==>OK -->MasterBootRecord(MBR)	------->(A)
				  (boot_loaderCode+PartitionTable)

(A) --->Bootloader ====> Kernel ==>Process

initramfs 
 |->tempfs - memory based filesystem 
  	   - pre-load the drivers (kernel modules) to memory
	   - execute the drivers code
	   - load the actual kernel to memory
	   - then real root file system is mounted.
		  -------------- 
			/ 

oracle@gateway~]$ uname -r
|
oracle@gateway~]$ ls /boot {Enter}

vmlinuz-<version>
initramfs-<version>.img

grub - bootloader

OL[56] => grub
OL[789] =>grub2 - bootloader 

ls /boot
grub2 
-------------------------
uname -r
<version>
lsinitrd /boot/initramfs-<version>.img {enter}

=================================================================
OL[56]
------
bootloader ->grub
/boot/grub/grub.conf 
 - created by anaconda 
 - root user - can edit this file content
 - format is INI format
    Key = Value 
    enabled=yes
    title="Welcome to Oracle Linux 5"  
   ..
 - save and exit - update grub.conf file
Vs

OL[89]
--------
bootloader -> grub2
/boot/grub/grub2
	   |->grub.cfg
- created by grub2-mkconfig template script(shell script)
- format is shell script 
	    ==============
- root user also can't edit /boot/grub2/grub.cfg
                 ==============================

- edit boot parameters =>/etc/default/grub 
			  ...
  |if do any changes inside /etc/default/grub file

run -> grub2-mkconfig -o /boot/grub2/grub.cfg
       ==============  -- =======================
--------------------------------------------------------------------------

dracut - commandline tool
------
 |-> create initramfs 
----------------------------------------------------------------------------
Bootloader
-----------
OFF ->SwitchON_PC ->POST ==>OK -->MasterBootRecord(MBR)	------->(A)
				  (boot_loaderCode+PartitionTable)

(A) --->Bootloader ====> Kernel ==>Process

   Process
   ---------
    |->OL[56] --> init <= PID:1
	Vs
    |->OL[789] --> systemd <== PID: 1
 

init : PID-1		Vs	systemD - PID:1
 |				  |
P2			---------------------------------
 |			|	|	|	|	|
P3			P2	P3	P4	P5 ..  Pn
 |
P4
 |
P5
------------------
ps -e|head {enter}
	|-> view - from top to bottom 10lines



pstree {Enter}
--------------------------------------------------------------
PowerOnPC --> 1. POST -->2. MBR -->3.Bootloader -->4.Kernel -->5.Process								 ..
		Login:_________
		Password:______
		|
		(Submit)
		 |
		Desktop(GUI) Vs Shell(CLI)
								
login/getty - login process
-------------------------------------------------------
User process		Vs		System Process
------------				---------------
- by user				- by systemD 
|					   |
- after login 				- before user login 
  with help of IO devices		- system processes are not created by
  create a new process			  IO devices -> TTY: ?
  TTY:pts/port
|						|
- user process parent is working shell	- system process parent is systemD
|						|
- Start -->R+ ==>exit			- start ->R+
	   ||    ====				 //running in background
	  stopped
-----------------------------------------------------------------------

ps
ps -e (or) ps -A
ps -l
ps -f 
top
kill -9 <PID>
<processName> & <== transfer to background
............. ---
jobs - see the background process
-----
[eventID] <processname>
fg %[eventID] <== transfer from background to foreground
------------------------------------------------------------------------
systemd - admin command is systemctl
			   ==========
init - admin command is service
			=======
------------------------------------------------------------------------
