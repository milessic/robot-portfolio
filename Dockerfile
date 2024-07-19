# Image
FROM ubuntu
LABEL name = "Robotframework Dockerimage"
MAINTAINER = "Miłosz Jura" <milosz.m.jura@gmail.com>

# set work direcotry
WORKDIR  /robot

# insert requirements.txt file
COPY requirements.txt /robot/

# update the Image
RUN apt-get update

# install python
RUN apt-get -y install python3	python3-pip

# install Robotframework and libraries
RUN python3 -m pip install -r requirements.txt --break-system-packages

# install NPM and playwright-dependecies
RUN python3 -m pip install nodejs-bin --break-system-packages
RUN python3 -m pip install 'nodejs-bin[cmd]' --break-system-packages
RUN apt-get install libglib2.0-0 libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libdbus-1-3 libxkbcommon0 libatspi2.0-0 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libgbm1 libpango-1.0-0 libcairo2 libasound2t64 -y

# initialize Browser
RUN python3 -m Browser.entry init

# Run tests
ENTRYPOINT ["robot"]

