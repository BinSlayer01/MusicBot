FROM ubuntu:18.04

# Add project source
WORKDIR /usr/src/musicbot

RUN apt-get update && apt-get install build-essential unzip -y
RUN apt-get update && apt-get install software-properties-common -y

RUN apt-get update && apt-get --assume-yes install git ffmpeg libopus-dev libffi-dev libsodium-dev python3-pip 
RUN apt-get upgrade -y

RUN git clone https://github.com/BinSlayer01/MusicBot.git -b master
RUN cd MusicBot

WORKDIR /usr/src/musicbot/MusicBot
COPY config/options.ini ./config/options.ini

# Install Python dependencies
RUN python3 -m pip install -U pip
RUN python3 -m pip install -U -r requirements.txt

CMD python3 run.py
