FROM alpine:3.8
# Use Alpine 3.8 because any higher doesn't build on the Zero

EXPOSE 8118 9050 9051

RUN apk --update add tor runit tini

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
