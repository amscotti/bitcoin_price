# Bitcoin Price

A simple Clojure application that shows the current price of bitcoins in US currency

## To Build
* Install Java
* Install [Leiningen](https://leiningen.org/)
* Run `lein uberjar`

## To Run
* `java -jar ./target/bitcoin_price-0.1.0-SNAPSHOT-standalone.jar`

## Docker

### Build
Run `docker build . -t bitcoin_price` to build a docker image.

### Run
There is an docker image you can use for you don't need to build the code yourself,
`docker run amscotti/bitcoin_price`

