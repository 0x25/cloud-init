#!/bin/sh

echo "--start init --"

apt-get install ircd-irc2 python-irclib wget

wget -O bot.py "https://raw.githubusercontent.com/0x25/cloud-init_lamp/master/ircbot.py"

sudo python bot.py&

echo "--end init--"
