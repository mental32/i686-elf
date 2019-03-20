# i686-elf
## lightweight cross compiler toolkit

This project attempts to provide multiple ways to build and setup a cross compiler toolchain.

## Requirements

Most if not all of the requirements, both required and optional, should already be on installed.

### Required

 - wget
 - make
 - tar


## Usage

 - git clone + run:
   - `git clone https://github.com/mental32/i686-elf && cd i686-elf && ./local.sh`

 - wget + run:
   - `sh -c "$(wget https://raw.githubusercontent.com/mental32/i686-elf/master/portable.sh -O -)"`

### Persisting in PATH

To persist access to the binaries in PATH append the following to your .rc file:
 - `export PATH="$PATH:~/.i686-elf/bin`

## Related projects
 - [i686-elf-tools](https://github.com/lordmilko/i686-elf-tools) (debian based toolkit)
 - [barebones-toolchain](https://github.com/rm-hull/barebones-toolchain) (barebones gcc cross-compiler and toolchain for multiple architectures)
