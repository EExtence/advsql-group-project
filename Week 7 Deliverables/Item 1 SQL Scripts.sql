USE Restaurant;

-- Task 1

DENY CONNECT TO [NT SERVICE\SQLSERVERAGENT];


-- Task 2

CREATE USER RestaurantUser WITHOUT LOGIN;

ALTER ROLE db_backupoperator ADD MEMBER RestaurantUser;


-- Task 3
USE Restaurant;

CREATE USER RestaurantDoAnything WITHOUT LOGIN;

ALTER ROLE db_owner ADD MEMBER RestaurantDoAnything;


-- Task 4

USE master;

CREATE LOGIN RestaurantAddDeleteDb WITH PASSWORD = 'StrongPassword123!';

ALTER SERVER ROLE dbcreator ADD MEMBER RestaurantAddDeleteDb;

USE Restaurant;
CREATE USER RestaurantAddDeleteDb FOR LOGIN RestaurantAddDeleteDb;

DENY INSERT TO RestaurantAddDeleteDb;



-- Task 5
USE Restaurant;

CREATE USER RestaurantPower WITHOUT LOGIN;

ALTER ROLE db_securityadmin ADD MEMBER RestaurantPower;

ALTER ROLE db_accessadmin ADD MEMBER RestaurantPower;
