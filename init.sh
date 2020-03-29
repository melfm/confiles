#/bin/sh
set -e # exit on first error

install_dependencies()
{
    sudo apt-get update
    sudo apt-get install -y \
	xterm \
        git \
	    exuberant-ctags \
        vim-nox \
        i3 \
        xinit \
        xbacklight \
        network-manager-gnome \
        thunar \
        lxappearance \
        pavucontrol \
        v4l-utils \
        thunar-archive-plugin \
        xfce4-screenshooter \
        tmux \
        redshift redshift-gtk \
	python-matplotlib \
	arandr \
	xclip \
	sshfs \
	meld \
	htop \
	feh
}


install_dropbox()
{
    cd $HOME
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd &
    cd -
}

install_chrome()
{
     wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
     sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
     sudo apt-get update
     sudo apt-get install google-chrome-stable
}

install_tensorflow()
{
     sudo apt-get install python-pip python-dev
     sudo pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.9.0-cp35-cp35m-linux_x86_64.whl
}

install_python_pckgs()
{
    sudo apt-get install python-pip python-dev
    sudo pip install virtualenv
}


git_config()
{
    git config --global user.name "Melissa Mozifian"
    git config --global user.email "melissafm24@gmail.com"
    git config --global push.default matching
}

init_dotfiles()
{
    # REMOVE OLD DOTFILES
    echo "remove old dotfiles"
    rm -rf $HOME/.vim
    rm -f $HOME/.vimrc
    rm -f $HOME/.screenlayout

    # SYMLINKS
    echo "symlinks dotfiles"
    ln -fs $PWD/vim $HOME/.vim
    ln -fs $PWD/vim/vimrc $HOME/.vimrc
    #ln -fs $PWD/screenlayout $HOME/.screenlayout

    return 0;
}

init_vim()
{
    echo "install vim plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    vim -c VundleInstall -c quitall

    return 0;
}

install_python_dev()
{
    echo "install python3 dev and pip3"
    sudo apt-get install python3-pip python3-dev
}

init()
{
    install_dependencies
    install_python_pckgs
    # install_dropbox
    git_config
    install_python_dev
    init_dotfiles
    init_vim
    echo "Done! :)"
}

# MAIN
init
