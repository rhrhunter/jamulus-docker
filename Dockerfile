FROM alpine:3.9 as builder

ENV JAMULUS_VERSION 3_5_1

RUN \
 echo "**** install build packages ****" && \
   apk update && apk add --no-cache --virtual .build-dependencies \
        build-base \
        qt-dev \
        git

WORKDIR /tmp
RUN git clone https://github.com/corrados/jamulus.git
WORKDIR /tmp/jamulus

# Github directory format for tar.gz export
RUN \
 echo "**** compiling source code ****" && \
   qmake "CONFIG+=nosound" Jamulus.pro && \
   make clean && \
   make && \
   cp Jamulus /usr/local/bin/

FROM alpine:3.9

RUN apk add --update --no-cache \
    qt-x11 icu-libs tzdata

COPY --from=builder /usr/local/bin/Jamulus /usr/local/bin/Jamulus
ENTRYPOINT ["Jamulus"]
