#!/bin/sh

nvim(){
  #Installing nvim from source
  cd $HOME
  if ![-d "~/neovim"] 
  then 
    git clone https://github.com/neovim/neovim.git
  fi	
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

  if ![-d "~/alacritty"]; 
  then 
    git clone https://github.com/alacritty/alacritty.git
  fi
  cd alacritty

  #Install rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  #Dependanices
  apt-get -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

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
  apt-get install -y i3 compton blueman feh
}

tmux(){
  apt-get install -y tmux
}

zsh(){
  apt-get install -y zsh	

  #change shell to zsh
  chsh -s $(which zsh)
}

fonts(){
  apt-get install -y fonts-hack
  apt-get install -y fonts-font-awesome

  # dir = ~/.local/share/fonts
  # cd /usr/share/fonts/truetype 
  # mkdir hack
  # cd hack

  # mkdir -p ~/.local/share/fonts
  # cd ~/.local/share/fonts

  # curl -fLo "Hack-Regular.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
  # curl -fLo "Hack-Italic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
  # curl -fLo "Hack-BoldItalic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
  # curl -fLo "Hack-Bold.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
  # curl -fLo "Font-Awesome-5-Free-Regular-400.otf" https://github.com/FortAwesome/Font-Awesome/blob/master/otfs/Font%20Awesome%205%20Brands-Regular-400.otf 
  # curl -fLo "Font-Awesome-5-Brands-Regular-400.otf" https://github.com/FortAwesome/Font-Awesome/blob/master/otfs/Font%20Awesome%205%20Brands-Regular-400.otf
  # curl -fLo "Font-Awesome-5-Free-Solid-900.otf" https://github.com/FortAwesome/Font-Awesome/blob/master/otfs/Font%20Awesome%205%20Free-Solid-900.otf
  # fc-cache -f -v
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

brave(){
  apt install apt-transport-https curl
  curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|tee /etc/apt/sources.list.d/brave-browser-release.list
  apt update
  apt install brave-browser
}

# brave
# configs
# fonts
# nvim 
# alacritty
# i3
# tmux
# zsh


