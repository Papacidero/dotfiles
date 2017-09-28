config:
	echo "Starting configuration and installation..." && \
	make install-apps && \
	make install-install-oh-my-zsh && \
	make link-dotfiles && \
	echo "You user is succesfuly configured!"

install-brew:
	echo "Installing Brew..." && \
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
	echo "Installing Brew Finished!" 

install-apps:
	echo "Installing Apps..." && \
	brew cask install iterm2 google-chrome visual-studio-code skype telegram docker && \
	brew install autojump git-extras node zsh zsh-completions git && \
	echo "Installing Apps Finished!"

install-oh-my-zsh:
	echo "Installing oh-my-zsh..." && \
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo "Installing oh-my-zsh Finished!"

link-dotfiles:
	echo "Linking Dotfiles..." && \
	rm -rf ../.zshrc && ln zsh/.zshrc ../.zshrc  && \
	rm -rf ../.oh-my-zsh/themes/papacidero.zsh-theme && \
	ln zsh/.oh-my-zsh/themes/papacidero.zsh-theme ../.oh-my-zsh/themes/papacidero.zsh-theme && \
	rm -rf ../.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh && ln zsh/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh ../.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh && \
	rm -rf ~/Library/Application\ Support/Code/User/settings.json && ln  vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	echo "Linking Dotfiles Finished!" && \


vscode-sync:
	echo "Synching vscode..." && \
	make vscode-link-settings && \
	make vscode-extensions-list && \
	echo "Synching vscode Finished!"

vscode-link-settings:
	ln ~/Library/Application\ Support/Code/User/settings.json settings.json
	
vscode-extensions-list:
	cd vscode && echo "code --install-extension" > extensions.list && code --list-extensions >> extensions.list