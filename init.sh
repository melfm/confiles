#/bin/sh
set -e # exit on first error

install_dependencies()
{
    sudo apt-get update
    sudo apt-get install -y \
        git \
        vim \
        i3 \
        xinit \
        xbacklight \
        network-manager-gnome \
        thunar \
        gnome-icon-theme-full \
        pavucontrol \
        v4l-utils
}

install_dropbox()
{
    cd $HOME
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd &
    cd -
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
    ln -fs $PWD/screenlayout $HOME/.screenlayout

    return 0;
}

init_vim()
{
    echo "install vim plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    #git submodule init
    #git submodule update
    vim -c VundleInstall -c quitall
    exec ./vim/bundle/fzf/install --all

    return 0;
}

init()
{
    #install_dependencies
    #install_dropbox
    #git_config
    init_dotfiles
    init_vim
    echo "Done! :)"
}

init
