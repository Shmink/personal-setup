#!/bin/sh
mkdir setup && cd setup
apt update
apt upgrade -y
ubuntu-drivers autoinstall -y

apt-get install mint-meta-codecs -y
apt-get install git vim xclip -y
apt-get install python-pip -y
apt-get install tldr -y


# Repos
add-apt-repository ppa:snwh/pulp

apt-get update

apt-get install paper-icon-theme -y

# vim plugins
# https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

# git config
git config --global user.name 
git config --global user.email
git config --global core.editor "vim"

# Elixir
apt-get install erlang -y
apt-get install elixir -y
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
reset
asdf plugin-add elixir
asdf install elixir 1.7.3
asdf global elixir 1.7.3
asdf plugin-update --all

# Repos


# TLP (battery management - laptop users only)
add-apt-repository ppa:linrunner/tlp
apt-get update
apt-get install tlp tlp-rdw -y
# Thinkpad laptops only
apt-get install tp-smapi-dkms acpi-call-dkms -y

# Chrome browser
apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb

# VScode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt-get install apt-transport-https
apt-get update
apt-get install code -y

# vagrant
apt-get install virtualbox vagrant -y
vagrant plugin install omnibus
vagrant plugin install vagrant-omnibus

# dbeaver (sql viewer)
apt install dbeaver-ce -y

# ZSH
apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
apt-get install fonts-powerline -y
cp zsh/shmink.zsh-theme ~/.oh-my-zsh/themes 
rm ~/.zshrc
cp zsh/.zshrc ~
source ~/.zshrc

# snap
apt install snapd -y

# spotify
snap install spotify
snap run spotify

# albert
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
apt-key add - < Release.key
apt update
apt-get install albert -y
cp albert/albert.conf ~/.config/albert/

# ristretto
apt install ristretto tumbler -y

# mpv
apt install mpv -y
echo "loop=yes" > ~/.config/mpv/mpv.conf

# shutter
apt install shutter -y

# gthumb
apt install gthumb -y

# dropbox
apt install dropbox -y

# discord
snap install discord
snap run discord

# steam
apt install steam-installer -y

# LaTeX
apt install texlive texstudio -y

# cleanup
cd ..
rm -rf setup

echo "Done :) Rebooting now"

reboot now
