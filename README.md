# NeoVim compatibility
> https://github.com/neovim/neovim


      # install neovim with python  
      brew install python
      brew install python3
   
      pip  install --upgrade neovim
      pip2  install --upgrade neovim
      pip3  install --upgrade neovim
   
      brew install neovim/neovim/neovim
   
      ln -s ~/.vim ~/.config/nvim
      ln -s ~/.vimrc ~/.config/nvim/init.vim

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


* tmux config: wget https://gist.github.com/sletix/4598bfe919ff51b0a3cc/raw -O ~/.tmux.conf
