FROM node:latest
WORKDIR /app
COPY ./policy-app .
RUN npm install
ENTRYPOINT ["npx", "-p", "@angular/cli", "ng", "serve", "--host", "0.0.0.0", "--port", "8000"]