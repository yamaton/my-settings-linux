mkdir tweaks
cd tweaks
git clone https://github.com/yamaton/mysetting.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/olivierverdier/zsh-git-prompt.git
cp mysetting/.zshrc ~
cp mysetting/.tmux.conf ~
cp mysetting/.emacs ~
sudo apt update
sudo apt full-upgrade
sudo apt install zsh
chsh -s $(which zsh)
sudo apt install tmux
sudo apt install emacs-nox