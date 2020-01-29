# i686-elf
## lightweight cross compiler toolkit

This project attempts to provide multiple ways to build and setup a cross compiler toolchain.

## Requirements

Most if not all of the requirements, both required and optional, should already be on installed.

### Required

 - wget
 - make
 - tar

## Usage (after cloning)

 - `make` (its recommended you supply the `-j` flag for parallel building.)

### Persisting in PATH

 - `export PATH="$PATH:~/.local/i686-elf/bin"`

## Related projects

 - [i686-elf-tools](https://github.com/lordmilko/i686-elf-tools) (debian based toolkit)
 - [barebones-toolchain](https://github.com/rm-hull/barebones-toolchain) (barebones gcc cross-compiler and toolchain for multiple architectures)
