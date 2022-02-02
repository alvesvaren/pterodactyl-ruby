
# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        ruby:alpine

LABEL       author="Alve" maintainer="alve@hotmail.se"

RUN         apk add --no-cache --update libc6-compat ffmpeg g++ make sqlite sqlite-dev libsass \
            && adduser -D -h /home/container container

RUN         gem install sinatra slim sqlite3 puma bcrypt 

USER        container
ENV         USER=container HOME=/home/container RACK_ENV=production
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
