#!/bin/sh

nvim (){
	#Installing nvim from source
	cd $HOME
	git clone "git@github.com:neovim/neovim.git"
	
	cd neovim
	
	#Installing dependancies
	apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

	make
	make install

	#for telescope
	apt-get -y install ripgrep
}

alacritty(){
	cd $HOME

	git clone https://github.com/alacritty/alacritty.git
	cd alacritty

	#Install rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	#Dependanices
	apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

  apt-get install -y cargo
	cargo build --release

	#Add to path
	cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
	cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	desktop-file-install extra/linux/Alacritty.desktop
	update-desktop-database

	#Alacritty as default shell
	update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50		
	update-alternatives --config x-terminal-emulator
}

i3(){
	apt-get install -y i3 compton blueman
}

tmux(){
	apt-get install -y tmux
}

zsh(){

	apt-get install -y zsh	

	#oh my zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	#change shell to zsh
	# chsh -s $(which zsh)
}

fonts(){
  sudo apt-get install -y fonts-hack
}

configs(){
	cd $PWD
	apt-get install -y stow	
	for path in $PWD/* ; do
		[ -d "${path}" ] || continue # if not a directory, skip
		dirname="$(basename "${path}")"
		stow -D $dirname
		stow $dirname
	done

}

# fonts
# nvim 
# alacritty
# i3
# tmux
zsh
configs

