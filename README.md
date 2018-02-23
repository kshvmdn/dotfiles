## dotfiles

My configuration files for [Bash](bash), [Git](git), [Homebrew](brew), [iTerm2](iterm), [tmux](tmux), and [more](extras).

### Installation

I highly suggest that you read through each installation file before running the following commands. They'll likely overwrite your existing dotfiles.

```sh
$ git clone --recurisve https://github.com/kshvmdn/dotfiles.git
$ cd dotfiles
$ for dir in $(command ls); do [[ -d $dir && -f $dir/install.sh ]] && sh $dir/install.sh; done
```

Heavily inspired by [**@qasim**](https://github.com/qasim)'s [dotfiles](https://github.com/qasim/dotfiles).
