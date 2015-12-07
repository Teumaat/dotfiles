#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
for file in $(ls -1a | grep "^\.[a-z][a-z\._-]\+$" ); do
  if [ "$file" == ".git" ]; then
    continue
  fi
  if [ -f "$HOME/$file" ] || [ -h "$HOME/$file" ] || [ -d "$HOME/$file" ]
  then
    echo -n "$HOME/$file already exists. do you want to overwrite? this will remove the existing file or folder. (Y/n): "
    read response
    if [ "$response" == "Y" ] || [ "$response" == "y" ] || [ "$response" == "" ]
    then
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

echo "Updating font cache .."
fc-cache -f

echo -n "Install Solarized profile for Xfce4 terminal? (Y/n): "
read response
if [ "$response" == "Y" ] || [ "$response" == "y" ] || [ "$response" == "" ]; then
  mkdir $HOME/.config/xfce4/terminal -p
  ln -s $DIR/terminalrc $HOME/.config/xfce4/terminal/terminalrc
fi

echo "All done :)"
echo " "
