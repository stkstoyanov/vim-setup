An updated version of my old vim configuration.

Installation
------------

Clone the repository:
```
cd ~
git clone https://github.com/stkstoyanov/vim-setup.git .vim
```

Clone all plugins to the local repository:

```
git submodule update --init --recursive
```

Create a symbolic link for the .vimrc file:

```
ln -s ~/.vim/vimrc ~/.vimrc
```

On Windows you can create a _vimrc in your home directory and edit it with:

```
so .vim/.vimrc
```