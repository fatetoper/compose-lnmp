FROM node:12-slim
LABEL "PowerBy"="fatetoper"
COPY ./ /wwwroot
WORKDIR /wwwroot
RUN npm i --registry=https://registry.npm.taobao.org
ENV NODE_ENV dev
EXPOSE 8080