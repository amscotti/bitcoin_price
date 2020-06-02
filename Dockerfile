FROM openjdk:8-alpine

# Disable warnings
ENV LEIN_ROOT=1

RUN apk add --update wget ca-certificates bash tzdata && \
    wget -q "https://raw.githubusercontent.com/technomancy/leiningen/2.9.3/bin/lein" -O /usr/local/bin/lein && \
    chmod 0755 /usr/local/bin/lein && \
    lein --version

WORKDIR /build/
COPY . /build/
RUN lein uberjar

FROM openjdk:8-alpine
WORKDIR /root/
COPY --from=0 /build/target/bitcoin_price-0.1.0-SNAPSHOT-standalone.jar .
CMD ["java", "-jar", "./bitcoin_price-0.1.0-SNAPSHOT-standalone.jar"]