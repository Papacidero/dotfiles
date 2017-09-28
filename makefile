config:
    make install-brew && \
    make install-apps && \
    make install-install-oh-my-zsh && \
    make link-dotfiles && \
    echo "You user is succesfuly configured !"

install-brew:
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-apps:
    brew cask install iterm2 google-chrome visual-studio-code skype telegram docker &&
    brew install autojump git-extras node zsh zsh-completions git

install-oh-my-zsh:
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"    

link-dotfiles:
	rm -rf ../.zshrc && ln zsh/.zshrc ../.zshrc  && \
	rm -rf ../.oh-my-zsh/themes/papacidero.zsh-theme && \
	ln zsh/.oh-my-zsh/themes/papacidero.zsh-theme ../.oh-my-zsh/themes/papacidero.zsh-theme && \
	rm -rf ../.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh && ln zsh/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh ../.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh