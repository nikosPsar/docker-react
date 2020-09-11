FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
ENV HTTP_PROXY=http://icache.intracomtel.com:80
ENV HTTPS_PROXY=http://icache.intracomtel.com:80
RUN npm install
COPY . .
RUN npm rum build


FROM nginx
COPY --from=builder /app/build /usr/sjare/nginx/html
