# install notes

    # clone config and create symlink
    git clone git://github.com/sletix/.vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

    # install plugin-manager
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle

    # install all plugins (in vimrc)
    vim +PluginInstall +qall

    # done


**`optional`**

* [Powerline python-version](https://github.com/Lokaltog/powerline)

* [Menlo font with Powerline](https://gist.github.com/1595572)
