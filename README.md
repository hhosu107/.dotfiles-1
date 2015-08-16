dotfiles
=====

Requires `git` and `zsh`

```bash
cd ~
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1

ln -sf .dotfiles/.vim .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.zshrc .
ln -sf .dotfiles/.gemrc .
ln -sf .dotfiles/.gitconfig .
ln -sf .dotfiles/.gitexclude .
ln -sf ~/.dotfiles/.ssh/config .ssh

# tmux
ln -sf .dotfiles/.tmux .
ln -sf .dotfiles/.tmux.conf .
cd .dotfiles && git submodule update --init --depth=1 --recursive && cd ~
```

* [Cheatsheat of various commands](cheatsheat.md)
* [Making various development environments](installation.md)
* [Don't forget what you've installed](packages.md)

--------

* **OS X**
* **MSYS2**
* **Arch Linux**
* hyeon.me
* upnl.org (server, upnl, root)
* uriel.upnl.org

--------

BSD 2-Clause
