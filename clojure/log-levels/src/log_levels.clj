(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  ;; (re-find #"\[WARNING\]: " s)
  ;; (last (str/split s, #"\[WARNING\]: "))
  ;; (last (str/split s, #"\[ERROR\]: "))
  ;; (last (str/split s, #"\[INFO\]: "))
  (clojure.string/trimr (last (str/split s, #"\[\w+\]:\s*")))
  )

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  )

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  )
