#!/bin/bash -e

BAK=$(pwd)/bak
mkdir -p $BAK/{bash,vim,git,misc}

# Bash
mv ~/.bash{rc,_{aliases,exports,functions,path,profile}} $BAK/bash; (
  find $(pwd)/bash/.bash* -exec ln -sf {} \;
  mv .bash* ~
)

# Vim
mv ~/{.vim,.vimrc} $BAK/vim; (
  mkdir -p ./vim/.vim/autoload ./vim/.vim/bundle && \
  curl -LSso ./vim/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  ln -sf $(pwd)/vim/.vim ~/.vim
  ln -sf $(pwd)/vim/.vimrc ~/.vimrc
)

# Git
mv ~/{.gitconfig,.gitignore_global} $BAK/git; (
  ln -sf $(pwd)/git/.gitignore_global ~/.gitignore_global
  ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
)

# Misc.
mkdir -p ~/dev/{bin,src/{github.com/{kashav,kshvmdn},gitlab.com/{chapsule,kashav}}}

mv ~/.tmux.config ~/$BAK/misc
ln -sf $(pwd)/misc/tmux/.tmux.conf ~/.tmux.conf
