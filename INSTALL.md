Installing on Windows
=====================
I use the [Vim installer](http://sourceforge.net/projects/cream/files/Vim) provided by Cream (without Cream), primarily because it's compiled against Python.

To get everything working smoothly on Windows I usually install Git, Mercurial, etc first. The repos for the addons I use both Merucial and git so you'll need to install both for my vimrc to work out of the box. You could also strip out the vim-addon-manager stuff and use Vundle or something else instead and just stick with git.

If you are still trying to survive with just `cmd.exe` give [Console](http://sourceforge.net/projects/console/) a try.

Git
---
Install [Git](http://code.google.com/p/msysgit/downloads/list?can=3) which will provide basic UNIX executables, ls, curl, etc. Make sure it's added to `%PATH%`.

Mercurial
---------
Install [Mercurial](http://mercurial.selenic.com/downloads/) and verify it's added to `%PATH%`.


Python
------
Install [Python](http://python.org/download/releases/2.7.2/) and make sure to add `C:\Python27` and `C:\Python27\Scripts` to `%PATH%`. I bootstrap every Python install with distribute & pip, you should too:

    curl -O http://python-distribute.org/distribute_setup.py
    python distribute_setup.py
    easy_install pip

Install `flake8` for Python syntax checking.

    pip install flake8


Node
----
Install [node](http://nodejs.org/#download) and use `npm` to install CoffeeScript and jslint:

    npm install -g coffee-script jslint


Ruby
----
Install [Ruby](http://rubyinstaller.org/), make sure and have have it added to `%PATH%`. Use `gem` to install CoffeeTags:

    gem install CoffeeTags


Bin
---
Create `%HOME%/bin` if it doesn't exist and add it to `%PATH%`. You should dump miscellaneous scripts here. You'll want to add [`ctags.exe`](http://prdownloads.sourceforge.net/ctags/ctags58.zip) and [`ack.pl`](http://betterthangrep.com/ack-standalone) there. I use the following bat files to wrap `ack` and `flake8`:

*ack.bat*

    @C:\Program Files\Git\bin\perl %HOME%\bin\ack.pl %*

*flake8.bat*

    @C:\Python27\python.exe C:\Python27\Scripts\flake8 %*


Installing on Everything Else
=============================
Installing anywhere else is simple just run `setup.sh`. I provide `update.sh` which (unsurprisingly) updates your addons. Pretty much everything is optional, so you can install whatever you want as you need it.
