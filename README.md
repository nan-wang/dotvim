Installation:

    git clone git@github.com:nan-wang/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/.vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Delete a submodule:

    cd ~/.vim
    git submodule deinit bundle/asubmodule
    git rm -r bundle/asubmodule

Add a new submodule:

    cd ~/.vim
    git submodule add https://github.com/python-rope/ropevim.git bundle/ropevim
    git submodule init bundle/ropevim
    git submodule update bundle/ropevim

Update submodules with upstream repository:

    git submodule foreach git pull
