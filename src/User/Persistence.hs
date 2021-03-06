module User.Persistence where

import Snap.Snaplet.PostgresqlSimple
import Data.Int
import User.Queries
import User.Types

insertUser :: (HasPostgres m) => UserForm -> m Int64
insertUser = execute insertUserQuery

deleteUser :: (HasPostgres m) => Int -> m Int64
deleteUser key = execute deleteUserQuery [key]

updateUser :: (HasPostgres m) => User -> m Int64
updateUser User{..} = execute updateUserQuery 
  [ userName
  , userEmail
  , show userBirthDate
  , userPassword
  , show userGender
  , show $ unCurrency userIncome
  , show userKey]
