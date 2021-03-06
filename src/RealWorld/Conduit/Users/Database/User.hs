module RealWorld.Conduit.Users.Database.User
  ( UserT(..)
  , User
  , UserId
  , PrimaryKey(UserId, unUserId)
  ) where

import Prelude hiding (id)
import Database.Beam (Beamable, Columnar, Identity, PrimaryKey, Table(..))

data UserT f = User
  { id :: Columnar f Int
  , password :: Columnar f Text
  , email :: Columnar f Text
  , username :: Columnar f Text
  , bio :: Columnar f Text
  , image :: Columnar f (Maybe Text)
  }

deriving instance Generic (UserT f)
deriving instance Beamable UserT

type User = UserT Identity

deriving instance Show User
deriving instance Eq User
deriving instance Ord User

instance Table UserT where
  data PrimaryKey UserT f = UserId
    { unUserId :: Columnar f Int
    }
  primaryKey = UserId . id

deriving instance Generic (PrimaryKey UserT f)
deriving instance Beamable (PrimaryKey UserT)

type UserId = PrimaryKey UserT Identity

deriving instance Show UserId
deriving instance Eq UserId
deriving instance Ord UserId
