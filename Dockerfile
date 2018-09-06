FROM node:latest

ENV DEBIAN_FRONTEND noninteractive
ENV HUBOT_NAME totoy
ENV HUBOT_OWNER RyoKurosaki
ENV HUBOT_DESCRIPTION For i2m
ENV EXTERNAL_SCRIPTS "hubot-heroku-keepalive"

RUN useradd hubot -m

RUN npm install -g hubot coffeescript yo generator-hubot

USER hubot

WORKDIR /home/hubot

RUN yo hubot --owner="${HUBOT_OWNER}" --name="${HUBOT_NAME}" --description="${HUBOT_DESCRIPTION}" --defaults && sed -i /heroku/d ./external-scripts.json && sed -i /redis-brain/d ./external-scripts.json && npm install hubot-scripts && npm install hubot-slack --save && npm install hubot-cron --save

COPY scripts/* ./scripts/
COPY hubot-scripts.json ./

CMD node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
	npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))") && \
	bin/hubot -n $HUBOT_NAME --adapter slack
