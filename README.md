# install notes

    git clone git://github.com/sletix/.vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    # install [plugins]() (see vimrc#L9-L41 for depends)
    mkdir -p ~/.vim/bundle/vundle/
    vim -c "execute \"BundleInstall!\" | q | q"

* Powerline python-version
  * https://github.com/Lokaltog/powerline

* Menlo font with Powerline
  * https://gist.github.com/1595572
