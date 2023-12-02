#!/bin/sh
set -e # exit on first error

install_dependencies()
{
    sudo apt update
    sudo apt install -y \
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
        redshift-gtk \
        python3-matplotlib \
        arandr \
        xclip \
        sshfs \
        meld \
        htop \
        feh
}

install_python_pckgs()
{
    sudo apt install python3-pip python3-dev
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
    install_python_pckgs
    git_config
    init_dotfiles
    init_vim
    echo "Done! :)"
}

# MAIN
init
