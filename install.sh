#!/bin/bash

if [ -z $1 ]
then
	echo "Usage: ./install.sh [URL]"
	exit
fi

rm -rf out/
mkdir out/
cp class/smali/* out/
sed -i "s,%RL_URL%,$1,g" out/*.smali
