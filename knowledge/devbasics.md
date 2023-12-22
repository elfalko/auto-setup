# Dev Basics

Collection of knowledge sources and base tools which every dev should know or at least have heard of

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

## OS

### Linux

- everything doable via commandline means everything is scriptable, automatable
- everything is a text file, so everything fits well into version control
- most distros are usable via GUI, but don't bring advantage over MacOS or Windows unless you know some bash and your way around the commandline. 

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

### bash

- the glue that keeps the C/C++/Rust parts of linux together
- [good book for the basics](https://linuxcommand.org/tlcl.php)

### Tmux

wouldn't it be cool to have several terminals and switch fast between them? Maybe even disconnect and return to sessions later?

- tmuxinator
- works well via ssh sessions to continue where you left off after a disconnect

### ssh

the remote access tool

### mosh

trying to use ssh with a shitty connection? try mosh instead

### brow.sh 

trying to browse with a shitty connection and have a server with a better connection? try brow.sh instead

### scp / rsync

### grep

- ripgrep
- ag / silversearcher

### ncdu

### Makefiles

### fzf

fuzzy finder for files and contents

### sed

the OG search and replace tool. Too mighty for it's own good. Needs understanding of [regex](#regex) to use it

### regex

powerful matching expressions for bash scripts, editors and many other tools

[great playground website](https://regexr.com/)

### cron

time based script runner

[crontab guru is a great website to find the right expressions for schedules.](https://crontab.guru/)

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

