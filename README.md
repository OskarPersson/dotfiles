# Dotfiles

## ZSH + oh-my-zsh

### Linux
* Install

```
sudo apt-get install zsh
chsh -s $(which zsh)
```

* Log out and login back again to use your new default shell.
* Test that it worked with echo $SHELL. Expected result: /bin/zsh
* Install oh-my-zsh and copy `zshrc`
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp /path/to/dotfiles/zshrc ~/.zshrc
```

### OSX
* Install

```
brew install zsh zsh-completions
chsh -s $(which zsh)
```

* Log out and login back again to use your new default shell.
* Test that it worked with echo $SHELL. Expected result: /bin/zsh
* Install oh-my-zsh and copy `zshrc`
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo cp /path/to/dotfiles/zshrc ~/.zshrc
```

## ZSH Gruvbox Color Scheme
### Linux
* Clone repo
```
git clone https://github.com/metalelf0/gnome-terminal-colors.git
```
* Install dependency
```
sudo apt-get install dconf-cli
```
* Install color scheme
```
./install.sh
```


## Neovim
### OSX
```
brew install neovim/neovim/neovim the_silver_searcher
```
### Linux
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip silversearcher-ag
```

## vim-plug
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Setting up nvim and installing plugins
```
cp /path/to/dotfiles/nvim.vim ~/.config/nvim/init.vim
nvim -c PlugInstall
```
