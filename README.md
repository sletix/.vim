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

* [Powerline installs](https://powerline.readthedocs.org/en/latest/installation.html#installation-on-various-platforms)
    pip install --user powerline-status

    # uncomment in vimrc: Bundle "Lokaltog/vim-powerline" and run :BundleInstall in vim

* [Menlo font with Powerline](https://gist.github.com/1595572)
