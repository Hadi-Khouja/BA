FROM node:latest as node
WORKDIR /app
COPY ./policy-app .
RUN yarn install
RUN yarn build 

FROM nginx:alpine
COPY ./nginx/frontend.conf /etc/nginx/conf.d/default.conf
COPY ./wireframe/ /usr/share/nginx/html/wireframe
COPY --from=node /app/dist/policy-app /usr/share/nginx/html/policy-app