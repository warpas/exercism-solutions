(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]

  (->> (str/split s #"\[\w+\]:\s*")
       (last)
       (clojure.string/trimr)
       )
  )

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]

  (->> (re-seq #"\[(\w+)\]" s)
       (last)
       (map clojure.string/lower-case)
       (last)
       )
  )

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  )
