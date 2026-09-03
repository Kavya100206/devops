## Task 1: Soft Link & Hard Link

### Soft Link

A soft link is like a shortcut to another file. It stores the path of the original file. If the original file is deleted, the soft link stops working.

To create a soft link:

```bash
ln -s original.txt softlink.txt
````

To delete it:

```bash
rm softlink.txt
```

### Hard Link

A hard link is another name for the same file. Both the original file and the hard link point to the same data.

To create a hard link:

```bash
ln original.txt hardlink.txt
```

To delete it:

```bash
rm hardlink.txt
```

### Difference

* Soft link points to the file path, while a hard link points to the same inode.
* Soft links can become broken if the original file is deleted.
* Hard links continue to work even if the original file name is deleted.
* Soft links can point to directories and can work across filesystems, while hard links generally cannot.

### Interview Question

Q: What is the difference between a soft link and a hard link?

A: A soft link is like a shortcut that points to the original file's path, whereas a hard link points to the same inode and data as the original file.

## Task 2: adduser vs useradd

### adduser

`adduser` is a more user-friendly command for creating users. It guides us through the process and asks for details like the password.

Example:

```bash
sudo adduser testuser
```

### useradd

`useradd` is a lower-level command used to create users. It gives more control through command options, but some things may need to be configured manually.

Example:

```bash
sudo useradd -m testuser
```

### Difference

* `adduser` is simpler and interactive.
* `useradd` is more basic and command-line oriented.
* `adduser` is generally preferred for manually creating users on Ubuntu.
* `useradd` is useful when creating users through scripts or when more control is needed.

### Creating a Test User

```bash
sudo adduser testuser
```

To verify the user:

```bash
id testuser
```

## Task 3: journalctl

`journalctl` is used to view logs collected by the systemd journal. These logs are useful for checking system activity and troubleshooting services.

To view logs:

```bash
journalctl
```

To view the latest logs:

```bash
journalctl -n 20
```

To continuously watch new logs:

```bash
journalctl -f
```

To check logs for a specific service:

```bash
journalctl -u ssh
```

To see recent logs of a service:

```bash
journalctl -u ssh -n 20
```

The `-u` option is used to filter logs for a particular systemd service.

## Task 4: Linux Command Cheat Sheet

| Command   | Use                            |
| --------- | ------------------------------ |
| `pwd`     | Shows the current directory    |
| `ls`      | Lists files and directories    |
| `cd`      | Changes the directory          |
| `mkdir`   | Creates a directory            |
| `touch`   | Creates a file                 |
| `cp`      | Copies files or directories    |
| `mv`      | Moves or renames files         |
| `rm`      | Removes files                  |
| `cat`     | Displays file contents         |
| `grep`    | Searches for text              |
| `find`    | Finds files and directories    |
| `chmod`   | Changes file permissions       |
| `chown`   | Changes file ownership         |
| `whoami`  | Shows the current user         |
| `ps`      | Shows running processes        |
| `df -h`   | Shows disk usage               |
| `free -h` | Shows memory usage             |
| `history` | Shows previously used commands |
| `man`     | Shows the manual for a command |
