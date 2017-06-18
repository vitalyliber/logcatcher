FROM alpine:3.5
COPY . .
EXPOSE 8080
CMD ./logviewer
