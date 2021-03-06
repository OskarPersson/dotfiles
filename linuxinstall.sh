sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim python-dev python-pip python3-dev python3-pip zsh dconf-cli xclip silversearcher-ag
chsh -s $(which zsh)

sudo pip install --upgrade autopep8 jedi flake8 neovim

git clone https://github.com/metalelf0/gnome-terminal-colors.git ~/git/gnome-terminal-colors
~/git/gnome-terminal-colors/install.sh

git clone https://github.com/powerline/fonts ~/git/powerline-fonts
~/git/powerline-fonts/install.sh

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/git/dotfiles/nvim.vim ~/.config/nvim/init.vim
mkdir ~/.config/nvim/backup
nvim -c PlugInstall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/git/dotfiles/zshrc ~/.zshrc
