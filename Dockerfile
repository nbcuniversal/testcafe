FROM node:latest

ENV CHROME=/usr/bin/google-chrome
ENV DISPLAY=:99

# Install Chrome
RUN apt-get update && \
    apt-get install -y xvfb libxss1

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN export SCREEN_WIDTH=3840
RUN export SCREEN_HEIGHT=2160
# Set a working directory
WORKDIR /usr/src/app

# Run the container under "node" user by default
USER node
