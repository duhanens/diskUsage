# Activity 2 – disk_usage.sh

It prints the **N largest entries** under one or more
directories, optionally including both files and directories.

The script is designed for **beginner-level shell scripting** and uses only
basic tools such as `du`, `sort`, `head`, and `getopts`.

---

## Usage

usage: disk_usage.sh [-a -n N] directory...


### Options

- `-a`
  Include **all files AND directories**.
  Without this option, the script reports **only directories**.

- `-n N`
  Show the **top N entries**.
  Default value is **10**.

A directory argument is required.

---

## Examples

### Top 10 directories (default)

```bash
./disk_usage.sh /etc
```

## Top 5 directories

```bash
./disk_usage.sh -n 5 /etc
```

## Top 10 entries including files and directories

```bash
./disk_usage.sh -a /var
```

## Multiple directories at once

```bash
./disk_usage.sh -n 3 /etc /var
```

How It Works
1. Parsing options

The script uses:
```bash
getopts "an:"
```

This detects two options:

- -a → sets a flag (SHOW_ALL=1)

- -n N → stores the numeric value in N

After option parsing, shift is used to remove processed flags and leave
only directory arguments.

2. Default values

SHOW_ALL=0 → only directories

N=10 → top 10 entries if -n is not provided

These defaults match the assignment expectations.

3. Constructing the disk usage command

- If -a is not used:
```sh
du -h "$dir"
```
Reports directory sizes only.

If -a is used:
```sh
du -ah "$dir"
```
Reports both files and directories.

The -h ensures human-readable sizes (K, M, G).

All error messages (like unreadable folders) are suppressed with:
```sh
2>/dev/null
```
4. Sorting and showing the top N results

Output from du is piped into:
```sh
sort -hr
```
- -h → sort human-readable numbers

- -r → largest first
```sh
head -n "$N"
```
shows the top N entries.

# Requirements

/bin/sh

Standard POSIX utilities: du, sort, head, getopts

No external dependencies are required.

# Notes

The script handles multiple directories.

If no directory is provided, usage is printed.

All logic is implemented using beginner-level shell scripting techniques.
