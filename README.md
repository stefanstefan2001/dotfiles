# dotfiles
## Initial Setup and Installation

If on OSX, you will need to install the XCode CLI tools before continuing. To do so, open a terminal and type

```bash
xcode-select --install
```

Then, clone the dotfiles repository to your computer. This can be placed anywhere, and symbolic links will be created to reference it from your home directory.

```bash
git clone https://github.com/stefanstefan2001/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` will start by initializing the submodules used by this repository. Then, it will install all symbolic links into your home directory. Every file with a `.symlink` extension will be symlinked to the home directory with a `.` in front of it. As an example, `vimrc.symlink` will be symlinked in the home directory as `~/.vimrc`. Then, this script will create a `~/.vim-tmp` directory in your home directory, as this is where vim is configured to place its temporary files. Additionally, all files in the `$DOTFILES/config` directory will be symlinked to the `~/.config/` directory for applications that follow the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html), such as neovim.

Next, the isntall script will perform a check to see if it is running on an OSX machine. If so, it will install Homebrew if it is not currently installed and will install the homebrew packages listed in [`brew.sh`](install/brew.sh). Then, it will run [`installosx.sh`](installosx.sh) and change some OSX configurations. This file is pretty well documented and so it is advised that you __read through and comment out any changes you do not want__. Next, the script will call [`install/nvm.sh`](install/nvm.sh) to install Node.js (stable) using nvm.
