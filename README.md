## dotfiles

### Install

Installs my Bash, Vim, Git, and tmux configuration files. Moves all pre-existing configuration files to `$PWD/bak`. View [`install.sh`](./install.sh) for more information.

```sh
$ git clone https://github.com/kshvmdn/dotfiles dotfiles && cd $_
$ ./install.sh
```

### Extras

Installs [Homebrew](https://brew.sh/) and various formulae (refer to [`Brewfile`](./misc/Brewfile) / [`Caskfile`](./misc/Caskfile) for a list of software that'll be installed), as well as Go/Node tools. View [`extras.sh`](./extras.sh) for more information.

```sh
$ ./extras.sh
```

See [`st3`](./st3) for my Sublime Text 3 packages, icons, and themes of choice.
