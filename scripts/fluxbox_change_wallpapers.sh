#!/usr/bin/bash
wget https://picsum.photos/1920/1080 -O $HOME/.config/bg.jpg
rm wget-log
fbsetbg $HOME/.config/bg.jpg

