use Restaurant
GO

/*
Shows salary of each chef formatted with the euro symbol
Author: Eleanor Extence
Created: 2026-04-15

Returns: Multi column table containing the Employee ID, Name, and formatted salary
*/
IF OBJECT_ID('fnChefSalaryLookup') IS NOT NULL
	DROP FUNCTION fnChefSalaryLookup
GO

CREATE FUNCTION fnChefSalaryLookup()
	RETURNS @OutTable TABLE (
		EmployeeID int, Name varchar(50), Salary money)
BEGIN
	INSERT @OutTable
		SELECT
			EmployeeID,
			(FirstName + LastName) AS Name,
			FORMAT(Salary, 'C', 'en-IE') AS Salary
		FROM Employees
		INNER JOIN Roles
			ON Employees.RoleID = Roles.RoleID
		WHERE Roles.RoleName LIKE '%Chef'
	RETURN
END
GO