#!/bin/bash

DIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)

set -e -x
for file in $(\ls -a | xargs -0  echo | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//' | grep -f ignored-syncfiles -x -v); do

	if [ -a "$HOME/$file" ]; then
		echo "The file $file exists"
		if [ -a "$HOME/${file}.bak" ]; then
			echo "Backup File exists"
		else
			mv $HOME/$file $HOME/${file}.bak
		fi
		ln -s $DIR/$file $HOME/$file
	else
		echo "File does not exist"
		ln -s $DIR/$file $HOME/$file
	fi

done

