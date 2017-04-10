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
        gnome-icon-theme-full \
        pavucontrol \
        v4l-utils \
        thunar-archive-plugin \
        xfce4-screenshooter
}

install_tmux()
{
    cd /tmp
    sudo apt-get install -y \
        libevent-2.0-5 \
        libevent-dev \
        libncurses5-dev \
        libncursesw5-dev

    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    ./configure && make
    cp tmux /usr/local/bin
    cd ..
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
     sudo apt-get install python-pip
     sudo apt-get install python-pip python-dev
     sudo pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.10.0rc0-cp27-none-linux_x86_64.whl



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

init()
{
    install_dependencies
    #install_tmux
    install_dropbox
    install_chrome
    git_config

    init_dotfiles
    init_vim
    echo "Done! :)"
}

# MAIN
init
