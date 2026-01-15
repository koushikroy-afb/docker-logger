FROM alpine:latest
WORKDIR /app
COPY logger.sh .
RUN chmod +x logger.sh
CMD ["./logger.sh"]
