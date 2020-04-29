FROM alpine:3.9 as builder

RUN  apk update && apk add --no-cache \
        build-base \
        qt-dev \
        git

WORKDIR /tmp
ARG JAMULUS_RELEASE=r3_5_2
RUN git clone https://github.com/corrados/jamulus.git
WORKDIR /tmp/jamulus
RUN git checkout $JAMULUS_RELEASE

# Github directory format for tar.gz export
RUN qmake "CONFIG+=nosound" Jamulus.pro && \
        make clean && \
        make && \
        cp Jamulus /usr/local/bin/

FROM alpine:3.9

RUN apk add --update --no-cache \
        qt-x11 icu-libs tzdata

ENTRYPOINT ["Jamulus"]

COPY --from=builder /usr/local/bin/Jamulus /usr/local/bin/Jamulus

