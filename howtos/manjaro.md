---
title: Manjaro
layout: page
icon_svg_url: https://upload.wikimedia.org/wikipedia/commons/3/3e/Manjaro-logo.svg
description: |
  Modern installation of the Arch Linux distribution. My findings of how to live with it all.
---

## Fresh new system

You want to update the package management with:

```
sudo pacman-mirrors -f0 && sudo pacman -Syyu
```

## Installing yaourt

This grants you access to the AUR repository where many OSS packages live.

But its not longer supported. Best to use yay.

## yay

### installation

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### usage

searching for a package:

```
yay -Ss <package-name>
```

installing of a package:

```
yay -S <package-name>
```

## XFCE4

### Fonts

Installing the fonts you need:

...

## i3wm 

### screnshots

```
bindsym Control+Print exec gnome-screenshot -i
```

### Copy paste in i3wm

You need to run the following program to allow copy and paste between host and guest machines when using VMware Fusion:

```
In ~/.i3/config

Add the line

exec --no-startup-id vmware-user
```

## zsh

Installing zsh is a great idea, but there are some things you need to know.

* installing oh-my-zsh
* installing some plugins
* installing spaceship prompt

### .zshenv

Here is my .zshenv file with some goodies:

* pyenv

```
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
