#!/bin/bash
cd /app
echo "----- Now deployed web booting your repo ------ " 
gunicorn -b :5000 --reload --access-logfile - --error-logfile - app:app

if [ -z $UPSTREAM_REPO ]
then
  echo "Cloning main Repository"
  git clone https://github.com/GreyMatterbots/url-auto-delete-shortener-bot /Eva
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO "
  git clone $UPSTREAM_REPO /Eva
fi
cd /Eva
pip3 install -U -r requirements.txt
echo "Starting Bot...."
python3 bot.py
