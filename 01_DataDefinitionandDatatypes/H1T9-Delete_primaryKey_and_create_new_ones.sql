--Using SQL queries modify table Users from the previous task. 
--First remove current primary key then create new primary key that would be combination of fields Id and Username.
ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC072E0D0BEE

ALTER TABLE Users
ADD CONSTRAINT PK_UsersID PRIMARY KEY(Id,Username)
