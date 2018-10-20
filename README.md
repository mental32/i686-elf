# i686-elf
# lightweight cross compiler toolkit

i686-elf provides an extreemly lightweight solution to building a i686 cross compiler.

## Usage

git clone + run:
 - `git clone https://github.com/mental32/i686-elf && cd i686-elf && ./i686-elf.sh`

wget + run:
 - `sh -c "$(wget https://raw.githubusercontent.com/mental32/i686-elf/master/i686-elf.sh -O -)"`

After the script finishes the running user will have a new directory `build-i686-elf` in their home directory.
This should only contain a directory named `output`. Treat anything else inside as disposable **except for the output directory.**

Then just add it to your PATH (append this to the end of your .rc file)
 - `export PATH="$PATH:~/build-i686-elf/output`

## other solutions
 - [i686-elf-tools](https://github.com/lordmilko/i686-elf-tools) (debian based toolkit)
 - [barebones-toolchain](https://github.com/rm-hull/barebones-toolchain) (barebones gcc cross-compiler and toolchain for multiple architectures)
