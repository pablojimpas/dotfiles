#!/bin/sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$(du -L "$HOME/bin" | cut -f2 | paste -sd ':' -)"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$(du -L "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"
fi

# Add dotnet to path if exists
if [ -d "$HOME/dotnet" ] ; then
    PATH="$PATH:$HOME/dotnet"
    DOTNET_ROOT=$HOME/dotnet
    PATH="$PATH:$HOME/.dotnet/tools"
    DOTNET_CLI_TELEMETRY_OPTOUT=1
fi

# Add flutter to path if exists
if [ -d "$HOME/.flutter-git" ] ; then
    PATH="$PATH:$HOME/.flutter-git/bin"
fi

# Add pub to path if exists
if [ -d "$HOME/.pub-cache" ] ; then
    PATH="$PATH":"$HOME/.pub-cache/bin"
fi

# Add go to path if exists
export GOPATH=$HOME/.go
if [ -d "$HOME/.go" ] ; then
    PATH="$PATH:$HOME/.go/bin"
fi

# Add ruby gems path if exists
if [ -d "$HOME/.local/share/gem/ruby/2.7.0/bin" ] ; then
    PATH="$PATH:$HOME/.local/share/gem/ruby/2.7.0/bin"
fi

# Dircolors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Fix for Android Studio and other Java programs
export _JAVA_AWT_WM_NONREPARENTING=1

export ENV=$HOME/.kshrc

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

# Trick flutter command line tool
export CHROME_EXECUTABLE="brave"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export INPUTRC="$HOME/.inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GPG_TTY=$(tty)
export PASSWORD_STORE_DIR=~/doc/passwords
export FAV_ROOT_PATH=~/doc/links

# Other program settings:
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export MANPAGER="zathura"

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.PNG=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.JPG=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && shortcuts >/dev/null 2>&1 &

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/ttymaps.kmap 2>/dev/null

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
