module Numeric.Rig
  ( Rig(..)
  , fromNaturalNum
  ) where

import Numeric.Additive.Monoid
import Numeric.Multiplicative.Monoid
import Numeric.Semiring
import Data.Int
import Data.Word
import Prelude (Integer, Bool, Num(fromInteger),(/=),id)
import Numeric.Natural.Internal

fromNaturalNum :: Num r => Natural -> r
fromNaturalNum (Natural n) = fromInteger n

-- | A Ring without (n)egation

class (Semiring r, AdditiveMonoid r, MultiplicativeMonoid r) => Rig r where
  fromNatural :: Natural -> r
  fromNatural n = replicate n one

instance Rig Integer where fromNatural = fromNaturalNum
instance Rig Natural where fromNatural = id
instance Rig Bool where fromNatural = (0/=)
instance Rig Int where fromNatural = fromNaturalNum
instance Rig Int8 where fromNatural = fromNaturalNum
instance Rig Int16 where fromNatural = fromNaturalNum
instance Rig Int32 where fromNatural = fromNaturalNum
instance Rig Int64 where fromNatural = fromNaturalNum
instance Rig Word where fromNatural = fromNaturalNum
instance Rig Word8 where fromNatural = fromNaturalNum
instance Rig Word16 where fromNatural = fromNaturalNum
instance Rig Word32 where fromNatural = fromNaturalNum
instance Rig Word64 where fromNatural = fromNaturalNum