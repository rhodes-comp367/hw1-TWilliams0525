module Int2 where

-- import `plus` & `times` on Nats;
-- use these functions where appropriate below.
open import Nat

data Int : Set where
  -- (+ n) represents positive n.
  + : Nat → Int
  -- (- n) represents negative n.
  - : Nat → Int
  -- 0 can be represented as (+ zero) or (- zero).

-- given i, return i + 1.
isuc : Int → Int
isuc (+ n) = + (suc n)
isuc (- zero) = + (suc zero)
isuc (- (suc n)) = - n

-- given i, return i - 1.
ipred : Int → Int
ipred (+ zero) = - (suc zero)
ipred (+ (suc n)) = + n 
ipred (- n) = - (suc n)

-- given i, return -i.
ineg : Int → Int
ineg (+ n) = - n
ineg (- n) = + n

-- given i & j, return i + j.
iplus : Int → Int → Int
iplus (+ zero) m = m
iplus (- zero) m = m
iplus n (+ zero) = n
iplus n (- zero) = n
iplus (+ n) (+ m) = + (plus n m)
iplus (+ (suc n)) (- (suc m)) = iplus (+ n) (- m)
iplus (- (suc n)) (+ (suc m)) = iplus (- n) (+ m)
iplus (- n) (- m) = - (plus n m)

-- given i & j, return i - j.
iminus : Int → Int → Int
iminus n (+ m) = iplus n (- m)
iminus n (- m) = iplus n (+ m)

-- given i & j, return i * j.
itimes : Int → Int → Int
itimes (+ n) (+ m) = + (times n m)
itimes (+ n) (- m) = - (times n m)
itimes (- n) (+ m) = - (times n m)
itimes (- n) (- m) = + (times n m)

