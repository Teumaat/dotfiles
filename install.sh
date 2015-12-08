#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
for file in $(ls -1a | grep "^\.[a-z][a-z\._-]\+$" ); do
  if [ "$file" == ".git" ] || [ "$file" == ".fonts" ] ; then
    continue
  fi
  if [ -f "$HOME/$file" ] || [ -h "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
    echo -n "$HOME/$file already exists. do you want to overwrite? this will remove the existing file or folder. (Y/n): "
    read response
    if [ "$response" == "Y" ] || [ "$response" == "y" ] || [ "$response" == "" ]; then
      rm -rf $HOME/$file
      echo "Removing $HOME/$file.."
      echo "Installing $HOME/$file"
      ln -s $DIR/$file $HOME/$file
    fi
  else
    echo "Installing $HOME/$file"
    ln -s $DIR/$file $HOME/$file
  fi
done

echo " "
echo "Installing Vundle ... "
git clone https://github.com/VundleVim/Vundle.vim.git $DIR/.vim/bundle/Vundle.vim

echo " "
echo -n "Install Hack-Regular font? (Y/n): "
read response
if [ "$response" == "Y" ] || [ "$response" == "y" ] || [ "$response" == "" ]; then
  ln -s $DIR/.fonts $HOME/.fonts
  echo "Updating font cache .."
  fc-cache -f
fi

echo " "
echo -n "Install Solarized dark profile for Xfce4 terminal? (Y/n): "
read response
if [ "$response" == "Y" ] || [ "$response" == "y" ] || [ "$response" == "" ]; then
  mkdir $HOME/.config/xfce4/terminal -p
  ln -s $DIR/dark/terminalrc $HOME/.config/xfce4/terminal/terminalrc
fi

echo "Now installing Vundle plugins ... "
vim +PluginInstall +qall

echo " "
echo "All done :)"
echo " "
