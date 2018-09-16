.PHONY: help
help:
	@echo "Install kshvmdn's dotfiles."
	@echo
	@echo "Usage:"
	@echo "  make [bash|bin|brew|git|iterm|subl|tmux|vim] ..."

.PHONY: bash
bash:
	@ln -fsv $(CURDIR)/home/.{aliases,bash{_profile,rc},dockerfunc,exports,functions,inputrc,path} ~

.PHONY: bin
bin:
	@find $(CURDIR)/bin -type f -exec ln -fsv {} /usr/local/bin \;
	@echo "Run \`install.sh\` to install stuff."

.PHONY: brew
brew:
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew bundle --file=$(CURDIR)/brew/Brewfile --verbose

.PHONY: git
git:
	@ln -fsv $(CURDIR)/home/.git{config,ignore} ~
	@echo "Update your credentials in $(HOME)/.gitconfig :"
	@echo "\t$$ git config --global user.name \"NAME\""
	@echo "\t$$ git config --global user.email \"EMAIL\""
	@echo "\t$$ git config --global user.signingkey \"SIGNING KEY\""

.PHONY: iterm
iterm:
	@defaults write com.googlecode.iterm2 PrefsCustomFolder -string $(CURDIR)/iterm
	@defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1

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
