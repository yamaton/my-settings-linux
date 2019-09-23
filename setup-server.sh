#!/usr/bin/env bash

BASEDIR=$(dirname "$(readlink -f "$0")")
CONFDIR="${HOME}/confs"

echo ""
echo "BASEDIR: ${BASEDIR}"
echo "CONFDIR: ${CONFDIR}"
echo ""

# configurations are in ~/confs
[ ! -d "${CONFDIR}" ] &&  mkdir "${CONFDIR}"


# update the system and install essential
if [ "$(uname -s)" == "Linux" ] && [ -x "$(command -v apt)" ]; then
    sudo apt update && sudo apt full-upgrade
    sudo apt install -y curl openssh-server
fi


# latest git (ubuntu only)
if [ -x "$(command -v apt)" ] && [ "$(lsb_release -i -s)" == "Ubuntu" ]; then
    echo ""
    echo "--------------------------"
    echo "       git from ppa"
    echo "--------------------------"
    sudo apt-add-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git
fi


# zsh
echo ""
echo "--------------------------"
echo "        zsh & more"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-zsh.sh -f


# colored man with less
echo ""
echo "--------------------------"
echo "        colored man"
echo "--------------------------"
[ -f ~/.less_termcap ] && mv ~/.less_termcap ~/.less_termcap.backup
cp "${BASEDIR}"/.less_termcap ~


# tmux
echo ""
echo "--------------------------"
echo "        tmux"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-tmux.sh -f


# emacs
echo ""
echo "--------------------------"
echo "        emacs"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-emacs.sh -f


# neovim
echo ""
echo "--------------------------"
echo "        neovim"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-neovim.sh -f


# misc software
echo ""
echo "--------------------------"
echo "        misc software"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-misc.sh


# tldr
echo ""
echo "--------------------------"
echo "        tldr client"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-tldr.sh -f


# cht.sh
echo ""
echo "--------------------------"
echo "        cht.sh"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-cheatsheet.sh


# ripgrep ---better grep---
echo ""
echo "--------------------------"
echo "        ripgrep"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-ripgrep.sh -f


# bat ---quick look file---
echo ""
echo "--------------------------"
echo "        bat"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-bat.sh -f


# nnn
echo ""
echo "--------------------------"
echo "        nnn"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-nnn.sh -f


# xsv ---better csvtools ---
echo ""
echo "--------------------------"
echo "        xsv"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-xsv.sh -f


# gotop --system monitor ---
echo ""
echo "--------------------------"
echo "        gotop"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-gotop.sh -f


# fd  ---find replacement---
echo ""
echo "--------------------------"
echo "        fd"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-fd.sh -f


echo ""
echo "--------------------------"
echo "        fzf"
echo "--------------------------"
cd "${BASEDIR}" || exit
./_setup-fzf.sh -f


echo ""
echo "--------------------------"
echo "        Cleaning up"
echo "--------------------------"
cd "${BASEDIR}" || exit
rm -f ./*.deb
rm -f ../*.deb

