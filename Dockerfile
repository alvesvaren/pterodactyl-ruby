FROM        ruby:latest

LABEL       author="Michael Parker" maintainer="docker@parkervcp.com"

RUN         apt-get update && apt-get upgrade \
            && adduser -D -h /home/container container
RUN         gem install sinatra puma bcrypt sqlite3 slim

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

# COPY        ./entrypoint.sh /entrypoint.sh

# CMD         ["/bin/ash", "/entrypoint.sh"]
