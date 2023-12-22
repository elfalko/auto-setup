# Dev Basics

Collection of knowledge sources and base tools which every dev should know or at least have heard of

If this feels linux focused, you got the right vibe. While reaching a stable and reliable dev environment under any other OS is possible, it seems to be the least hassle under linux.

## Editors

### VI/VIM/NVIM

- available on every linux distro
- works perfectly via ssh
- default for many linux things, e.g. git commits
- mode based editing is not immediately intuitive
- very powerful once learned
- can be used without any mouse/arrow key inputs
- halfway available in vscode as a plugin

#### Minimum knowledge

- `<Esc>` to leave whatever mode you are currently in
- `:` to start commands
- `<Esc>:wq<Enter>` to save and quit (`<Esc>ZZ` works too)
- `<Esc>:Tutor<Enter>` to learn more
- `:help <something>` opens manual to the correct section

#### nice to know

- `:tabe` for new tabs, `gt`/`gT` to switch between them
- `:ls` to show buffers, `:b<num>` to go to the right one
- `:spl`/`:vsp` for normal an vertical splits
- `gg=G` autoindents your entire code
- `%` to go to next bracket or other end of the current one
- `/` to search
- `:s/before/after/g` for search and replace
- `caw` changes a word and the whitespace around it
- `ci(` changes content of a round bracket

### nano

- shows help line by default at the bottom
- `<Ctrl>+x y <Enter>` to save a modified file
- available on most distros

### Emacs

- VI's evil twin (long standing rivalry in the community)
- different keybinds
- best known for org mode
- needs to be installed

## IDEs

### Visual Studio Code/VSCode

**Do not confuse this with Visual Studio**

- de facto recommended IDE for everything and everyone due to support and capability
- free
- from Microsoft, but actually quite good (probably because it is based on Jetbrainz Intellij)
- good integration with all common tools
- good integration with WSL

### Intellij Jetbrainz

- used to be the best IMHO but pricing point of vscode beat it

## Version Control Systems

### Git

- de facto industry standard
- developed by Linus Torvalds for the linux kernel
- free
- good docs
  - [git pro](https://git-scm.com/book/en/v2)
- most solid workflows are some variation of [git flow](https://nvie.com/posts/a-successful-git-branching-model/) (git-flow also exists as a specific package to support this, but I've never seen the need to use it)
- diverse graphical front ends exist, but CLI rules
- [gitui](https://github.com/extrawurst/gitui) (rust-based) offers a halfway solution
- [git bash](https://gitforwindows.org/) brings functionality under windows without ide

#### File types

- works best for pure text files, e.g. code, markdown, as diffs are meaningful and show changes between commits well
- works best with smaller files. [git-lfs](https://git-lfs.com/) handles larger ones

- docs in markdown work very well
  - automatic rendering in most hosting solutions
  - easy to learn and write
  - good integration for linking tickets, authors, issues merge requests by most hosting solutions

#### Hosting solutions

##### gitlab
##### Atlassian Bitbucket
##### Azure DevOps
##### Github

#### Credentials

SSH keys preferred

### SVN

subversion. used to be the standard before git, mostly faded out these days.

## OS

### Linux

- everything doable via commandline means everything is scriptable, automatable
- everything is a text file, so everything fits well into version control
- most distros are usable via GUI, but don't bring advantage over MacOS or Windows unless you know some bash and your way around the commandline. 

#### On choosing distros

Most distros mostly differ in the set of tools they deliver by default, but the most impact on the user experience have the following:

- package manager and release / update cycle
- desktop environments / window managers
- C implementation
- systemd / init

most tools are avialable in the package sources of almost all linux distros and can be easily installed even if they aren't.
Note that most documentation also works on many systems for that very reason.
E.g. [the arch wiki](https://wiki.archlinux.org/) is well known as one of the best linux documentation projects and instructions work for many distros
Choose one which has a sufficient user base to have documentation and support available and a release cycle which suits you.

Common examples are:

- Ubuntu (stable LTS release every two years)
- Debian (base of Ubuntu)
- Fedora

While the above ones are probably the best to start with to dive into linux, many other interesting ones exist:

- Arch (rolling release, very customizable, not for e.g. servers which should run untouched for-ever-ish)
- gentoo (like arch but you need to compile everything yourself)
- openSUSE
- FreeBSD
- NixOS

#### MS Office alternatives

- libreoffice
- openoffice
- [onlyoffice](https://www.onlyoffice.com/)

### Windows

Sadly the most common company OS.
If you are a dev and need to use it, check out WSL and Windows Terminal

#### WT Windows Terminal

Pretty solid terminal wrapper for both WSL and windows-native terminals cmd and powershell

#### putty / Cygwin

Until 2018, windows did not support ssh or similar tools for remote cli access to servers natively. Now it does. In most cases, if you read these in a tutorial, stop reading, open a powershell and try directly ssh'ing into whatever machine you are trying to connect to with this crutch

#### AHK

missing hot key features under windows?
[AHK](https://www.autohotkey.com/)

### WSL

Forced to use Windows? Fear not.

- Linux kernel running under windows, basically linux in a pocket. Run windows only for MS Office, Teams and Outlook and do all dev work in this
- integrates with VSCode and the windows file system relatively well
- wonky defaults (e.g. can steal up to 80% of the hosts RAM)
- only terminal, but read the next section

#### VcXSrv

X Server implementation to attach WSL to

- can display any graphical program from WSL
- Integration suboptimal, doesn't work out of the box, needs firewall rule

### MacOS

Fanciest Distro of all. While Apple did a lot of work to make it nice, the commandline is not buried deep enough to be unusable

### docker

one of the most common containerization tools these days. containers are like tiny, super generalized VMs containing only exactly what they need to run.
They try to solve the *but it runs on my machine* problem by having everyone run a virtual environment with the same parameters

docker-compose gives a good way to build up docker images in layers and chuck the result in version control.

Once you consider using docker and CI, look into hosting your own container registry

common base images are busybox and alpine linux. (Except on azure devops, where something under ubuntu is not considered worth running apparently)

## Other CLI tools


### Tmux

wouldn't it be cool to have several terminals and switch fast between them? Maybe even disconnect and return to sessions later?

- tmuxinator
- works well via ssh sessions to continue where you left off after a disconnect

### ssh

the remote access tool

use `~/.ssh/config` to setup memorable names for all your machines

goes hand in hand with ssh-key architecture.

#### ssh keys

`ssh-keygen` to generate a key
`ssh-copy-id <host>` to copy a public key to a different machine to simplify ssh login

#### sshrc

tired of not having your usual config on remote machines but you don't want to install it everywhere? check out [sshrc](https://github.com/cdown/sshrc)

### mosh

trying to use ssh with a shitty connection? try mosh instead

### brow.sh 

trying to browse with a shitty connection and have a server with a better connection? try brow.sh instead

### scp / rsync

need to transfer files? Just be aware that the progress bar massively reduces the transmission speed

`scp -Rc <source> <target>`
`rsync -avzm --progress <source> <target>`
### grep

- ripgrep
- ag / silversearcher

### ncdu

### Makefiles

### fzf

fuzzy finder for files and contents

### sed

the OG search and replace tool. Too mighty for it's own good. Needs understanding of [regex](#regex) to use it


### cron

time based script runner

[crontab guru is a great website to find the right expressions for schedules.](https://crontab.guru/)

### dd

to copy disks, isos and other stuff

### gcc

Gnu Compiler Collection. You need it for C/C++. It also brings gdb as a debugger along.

## CI/CD

writing code is good, but checking, building, testing and deploying it automatically is better

CI: Continuous integration
CD: Continuous deployment

for me, CI is more important. 

have a pipeline which:

1. lints the code
2. builds the code
3. if it builds, runs short term tests
4. if short term tests pass, run long-running tests
5. if all tests pass, ask for validation by the user
6. if the user validates, run a deployment pipeline


## Programming and other Languages

There are near as many as stars under the sky. This tries to list some useful links for the ones I know best.

[Godbolt compiler explorer](https://godbolt.org/): Ever wondered how different compiler versions behave? How the machine code looks? Sure you can take a look in the gcc output, but this is a nice web overview with fast switching between languages and compilers

### bash

- the glue that keeps the C/C++/Rust parts of linux together
- [good book for the basics](https://linuxcommand.org/tlcl.php)

### C

coding something close to hardware? Just make sure you understand pointers

### C++

coding for hardware, or ROS? want some more features than C?

### HTML/CSS/JavaScript

for when you need to build websites

HTML builds the structure, CSS makes it look good, an javascript builds interactivity.

The best course for webdesign I ever found is [here](https://internetingishard.netlify.app/).

### JSON

convenient way to store data objects

### LaTeX

Ever felt like MS Word just sucks after you tried to move a picture and the layout of your entire document changed? Or you switched chapter order and now need to update all references manually?

### Markdown

This file is markdown. It's like a simpler version of html and plays really nice with git.

### Matlab / Octave

Good data processing language

### Python

Writing some quick data analysis? Maybe some HIL test system where you want to integrate the local oscilloscope, the signal generator and the coffee machine in the test setup?

get pip and venv first, setup a virtual environment for each project and start coding.

good libs to know:

- venv
- numpy
- matplotlib (for plotting)
- opencv (for computer vision)
- subcommand (for running e.g. bash commands from python)
- pandas
- pytest (if you want to build a test system)

### regex

Powerful matching expressions for bash scripts, editors and many other tools

[great playground website](https://regexr.com/)

### rust

Want full type safety? I hear it is also good for embedded and the linux kernel these days 

### xml

extensible markup language. Often used for defining API interfaces, e.g. IODDs, SNMP MIBs
