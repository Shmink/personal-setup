mkdir setup && cd setup
sudo apt update
sudo apt upgrade -y

sudo apt-get install mint-meta-codecs -y
sudo apt-get install git vim xclip -y
sudo apt-get install python-pip -y
sudo apt-get install virtualbox vagrant -y

# Repos
sudo add-apt-repository ppa:snwh/pulp

sudo apt-get update

sudo apt-get install paper-icon-theme -y

# vim plugins
# https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

# git config
git config --global user.name 
git config --global user.email
git config --global core.editor vim

# Elixir
sudo apt-get install elixir -y
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
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw -y
# Thinkpad laptops only
sudo apt-get install tp-smapi-dkms acpi-call-dkms -y

# Chrome browser
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# VScode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code -y# or code-insiders

# ZSH
sudo apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo apt-get install fonts-powerline -y
cp zsh/shmink.zsh-theme ~/.oh-my-zsh/themes 
rm ~/.zshrc
cp zsh/.zshrc ~
source ~/.zshrc

# snap
sudo apt install snapd -y

# spotify
sudo snap install spotify
snap run spotify

# albert
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt update
sudo apt-get install albert -y
cp albert/albert.conf ~/.config/albert/

# ristretto
sudo apt install ristretto tumbler -y

# mpv
sudo apt install mpv -y
echo "loop=yes" > ~/.config/mpv/mpv.conf

# shutter
sudo apt install shutter -y

# gthumb
sudo apt install gthumb -y

# dropbox
sudo apt install dropbox -y

# discord
sudo snap install discord
snap run discord

# steam
sudo apt install steam-installer -y

# cleanup
cd ..
rm -rf setup

echo "Done :)"