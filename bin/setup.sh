#!/bin/bash


read "Would you like to overwrite your current .config files? (y/n)	" input


for dir in ../.config do
	if [$input == [yY]] then
		rm -r ~/.config/$dir
	fi
	ln -sf $dir ~/.config/$dir
done


