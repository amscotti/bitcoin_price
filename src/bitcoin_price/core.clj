(ns bitcoin-price.core
  (:require [clj-http.client :as client])
  (:gen-class))

(def price-url "https://api.coindesk.com/v1/bpi/currentprice.json")

(defn- get-prices []
  (-> (client/get price-url {:as :json})
       :body
       :bpi))

(defn- get-price-for [currency]
  (let [c (keyword currency)]
    (-> (get-prices)
         c
         :rate)))

(defn -main []
  (->> (get-price-for "USD")
       (str "Current bitcoin price in USD is $")
       (println)))

