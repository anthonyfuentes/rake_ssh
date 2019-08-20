
# SSH Rake Helper

## Installation

Fork and/ or clone this repository

```
git clone git@github.com:anthonyfuentes/rake_ssh.git
```

## Usage

1. cd into the local repo's root directory
2. Run ```rake ssh:show_copy_all[<path to your ssh config file>]```
3. Verify that the host, username, and identity file is correct for each
	 command in the resulting list
4. Run ```rake ssh:copy_all[<path to your ssh config file>]```
	* Enter your password for each host when prompted

