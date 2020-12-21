# Dotfiles

Configuration files required to setup a new machine.

## Installation

Cloning this repository in a new folder (e.g. ~/dotfiles)
```shell
git clone git@github.com:MichaelDorkhom/dotfiles.git
```

### VIM

#### Dependencies

Modules to be installed manually to enable all functionalities defined for VIM

- vim-plug

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- ripgrep
```shell
brew install ripgrep
```

#### Setup

The vim configuration is defined in `./.vimrc`.

Create a symlink from the "dotfiles" folder to the home directory
```shell
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
```

In `.vimrc`, install all the plugins using the "vim-plug" manager
```shell
:PlugInstall
```

### Git

The gitignore configuration is defined in `./.gitignore`.

#### Setup

Create a symlink from the "dotfiles" folder to the home directory
```shell
ln -s -f ~/Github/dotfiles/.gitignore_global ~/.gitignore_global
```

Setup the global "core.excludesfile" configuration file to point to the global ignore file
```shell
git config --global core.excludesfile ~/.gitignore_global
```