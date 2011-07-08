module Numeric.Multiplicative.Monoid
  ( MultiplicativeMonoid(..)
  , product
  ) where

import Numeric.Multiplicative.Class
import Data.Foldable hiding (product)
import Data.Int
import Data.Word
import Prelude hiding ((*), foldr, product)
import Numeric.Natural.Internal

infixr 8 `pow`

class Multiplicative r => MultiplicativeMonoid r where
  one :: r
  pow :: Whole n => r -> n -> r
  pow _ 0 = one
  pow x0 y0 = f x0 y0 where
    f x y 
      | even y = f (x * x) (y `quot` 2)
      | y == 1 = x
      | otherwise = g (x * x) ((y - 1) `quot` 2) x
    g x y z 
      | even y = g (x * x) (y `quot` 2) z
      | y == 1 = x * z
      | otherwise = g (x * x) ((y - 1) `quot` 2) (x * z)
  productWith :: Foldable f => (a -> r) -> f a -> r
  productWith f = foldl' (\b a -> b * f a) one

product :: (Foldable f, MultiplicativeMonoid r) => f r -> r
product = productWith id

instance MultiplicativeMonoid Bool where one = True
instance MultiplicativeMonoid Integer where one = 1
instance MultiplicativeMonoid Int where one = 1
instance MultiplicativeMonoid Int8 where one = 1
instance MultiplicativeMonoid Int16 where one = 1
instance MultiplicativeMonoid Int32 where one = 1
instance MultiplicativeMonoid Int64 where one = 1
instance MultiplicativeMonoid Natural where one = 1
instance MultiplicativeMonoid Word where one = 1
instance MultiplicativeMonoid Word8 where one = 1
instance MultiplicativeMonoid Word16 where one = 1
instance MultiplicativeMonoid Word32 where one = 1
instance MultiplicativeMonoid Word64 where one = 1