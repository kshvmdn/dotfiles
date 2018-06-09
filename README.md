## dotfiles

### Install

```console
$ git clone https://github.com/kshvmdn/dotfiles.git
$ cd dotfiles
$ ./brew/install.sh
$ for d in $(find . -maxdepth 1 -type d); do [ -f "$d/install.sh" ] && sh "$d/install.sh"; done
```

Heavily inspired by [qasim/dotfiles](https://github.com/qasim/dotfiles).
