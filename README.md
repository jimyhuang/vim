vim
===

my vimrc / vim plugin

INSTALL
=======

Clone and setup
---------------

```
git clone xxxx/vim
cd ~/
ln -s vim/.vimrc 
ln -s vim/.vim
```

download and install bundle
---------------------------

open editor(bundle will install vbundle automatically)
```
vim 
```

After vbundle downloaded, exit vim then enter again

```
vim
```
Then start to install another bundle
```
:BundleInstall!
```

Append this line at the end of .bashrc
```
export TERM=xterm-256color
```

Install ctags
```
apt-get install exuberant-ctags
```
Done!
