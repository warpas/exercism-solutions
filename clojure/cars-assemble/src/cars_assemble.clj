(ns cars-assemble)

(defn flawless_rate
  []
  221.0
  )

(defn success_rate
  [speed]
  (cond
    (< speed 5) 1.0
    (< speed 9) 0.9
    (= speed 9) 0.8
    :else 0.77)
  )

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* (* speed (flawless_rate)) (success_rate speed))
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60))
  )
