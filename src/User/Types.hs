{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE RecordWildCards, TypeSynonymInstances, FlexibleInstances #-}
module User.Types where

import Data.Time.Calendar
import Snap.Snaplet.PostgresqlSimple
import Database.PostgreSQL.Simple.ToField
import Database.PostgreSQL.Simple.FromField
import Data.Decimal

data User = User
  { userKey       :: Int
  , userName      :: String
  , userEmail     :: String
  , userBirthDate :: Day
  , userPassword  :: String
  , userGender    :: Gender
  , userIncome    :: Decimal}

data Gender 
  = Male
  | Female
  | Other
  deriving (Show,Eq)

instance ToField Gender where
  toField = toField . show

instance FromField Gender where
  fromField = fromField 

instance ToField Decimal where
  toField = toField

instance FromField Decimal where
  fromField = fromField

instance FromRow User where
  fromRow = User 
    <$> field 
    <*> field 
    <*> field 
    <*> field 
    <*> field 
    <*> field 
    <*> field

instance ToRow User where
  toRow User{..} = 
    [ toField userKey
    , toField userName
    , toField userEmail
    , toField userBirthDate
    , toField userPassword
    , toField userGender
    , toField userIncome]