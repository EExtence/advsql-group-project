use Restaurant

/*
Author: Eleanor Extence
Created: 2026-05-13

Create provided user/role and assign the required permissions to that role
Naming scheme is <Table name>_table_user
The wording is confusing in this deliverable, I interpreted it as create roles with the same permissions as the relevant fixed role.
Doing it this way allows me to specify which tables the permissions apply to
*/

-- a) Table: MenuDishes (Wk2 item h) Permissions: db_datareader
CREATE ROLE MenuDishes_table_user
GRANT SELECT
ON MenuDishes
TO MenuDishes_table_user

-- b) Table: Orders (Wk2 item l) Permissions: guest
-- I tried decerning what this was asking for but just couldn't so I figure select is harmless while not being totally useless.
CREATE ROLE Orders_table_user
GRANT SELECT
ON Orders
TO Orders_table_user

-- c) Table: ServerTables (Wk2 item o) Permissions: db_datawriter
CREATE ROLE ServerTables_table_user
GRANT INSERT, UPDATE, DELETE
ON ServerTables
TO ServerTables_table_user

-- d) Table: Employees (Wk2 item b) Permissions: db_accessadmin
CREATE ROLE Employees_table_user
ALTER ROLE db_accessadmin ADD MEMBER Employees_table_user

-- e) Table: (Wk 2 item p) Permissions: db_datareader, db_datawriter
CREATE ROLE Reservations_table_user
GRANT SELECT, INSERT, UPDATE, DELETE
ON Reservations
TO Reservations_table_user
