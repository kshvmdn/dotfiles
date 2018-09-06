.PHONY: help
help:
	@echo "Install kshvmdn's dotfiles."
	@echo
	@echo "Usage:"
	@echo "  make [bash|brew|git|iterm|scripts|subl|tmux|vim] ..."

.PHONY: bash
bash:
	@ln -fsv $(CURDIR)/home/.{aliases,bash{_profile,rc},dockerfunc,exports,functions,inputrc,path} ~

.PHONY: brew
brew:
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew bundle --file=$(CURDIR)/brew/Brewfile --verbose

.PHONY: git
git:
	@ln -fsv $(CURDIR)/home/.git{config,ignore} ~
	@echo "Update your user details in $(HOME)/.gitconfig :"
	@echo "\t$$ git config --global user.name \"NAME\""
	@echo "\t$$ git config --global user.email \"EMAIL\""
	@echo "\t$$ git config --global user.signingkey \"SIGNING KEY\""

.PHONY: iterm
iterm:
	@defaults write com.googlecode.iterm2 PrefsCustomFolder -string $(CURDIR)/iterm
	@defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1

.PHONY: scripts
scripts:
	@curl -sSL https://raw.githubusercontent.com/xvoland/Extract/master/extract.sh > /usr/local/bin/extract
	@chmod +x /usr/local/bin/extract
	@curl -sSL https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py  > /usr/local/bin/speedtest
	@chmod +x /usr/local/bin/speedtest
	@curl -sSL https://raw.githubusercontent.com/hnarayanan/shpotify/master/spotify > /usr/local/bin/spotify
	@chmod +x /usr/local/bin/spotify

.PHONY: subl
subl:
	@ln -fsv $(CURDIR)/sublime-text-3/*.sublime-settings \
		"$(HOME)/Library/Application Support/Sublime Text 3/Packages/User/"

.PHONY: tmux
tmux:
	@ln -fsv $(CURDIR)/home/.tmux.conf ~

.PHONY: vim
vim:
	@curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@ln -fsv $(CURDIR)/vim/vimrc ~/.vim
	@vim +PlugInstall +qall
