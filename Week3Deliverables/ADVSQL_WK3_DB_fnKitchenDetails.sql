use Restaurant
GO
/*
Returns the the name of the branch the kitchen is located at, the number of chefs assigned to the kitchen and the number of ovens in each kitchen
Author: Eleanor Extence
Created: 2026-04-16
*/
IF OBJECT_ID('fnKitchenDetails') IS NOT NULL
	DROP FUNCTION fnKitchenDetails
GO


CREATE FUNCTION fnKitchenDetails()
	RETURNS @KitchenDetails table (
		BranchName varchar(50), ChefCount int, OvenCount int)
BEGIN
	INSERT @KitchenDetails
		SELECT
			Locations.BranchName,
			COUNT(Employees.EmployeeID) AS ChefCount,
			Locations.KitchenStoves
		FROM Locations
		INNER JOIN EmployeeLocations
			ON Locations.LocationID = EmployeeLocations.LocationID
		INNER JOIN Employees
			ON EmployeeLocations.EmployeeID = Employees.EmployeeID
		INNER JOIN Roles
			ON Employees.RoleID = Roles.RoleID
		WHERE Roles.RoleName LIKE '%Chef'
		GROUP BY Locations.BranchName, Locations.KitchenStoves
	RETURN
END
GO

SELECT *
FROM dbo.fnKitchenDetails()