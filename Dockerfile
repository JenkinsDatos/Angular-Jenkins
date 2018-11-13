##STAGE 1: build Angular application ##
FROM node:8 as builder

COPY Angular5-Forms01 /Angular5-Forms01

WORKDIR /Angular5-Forms01

RUN npm install
RUN $(npm bin)/ng build

## STAGE 2: Run nginx to serve application ##
FROM nginx

COPY --from=builder /Angular5-Forms01/dist/* /user/share/nginx/html/

EXPOSE 80
