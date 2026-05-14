USE Restaurant
GO

IF OBJECT_ID('fnShowMenuItems') IS NOT NULL
	DROP FUNCTION fnShowMenuItems
GO


/* C - Menu Price - show me the unique menu items along with the price of those dishes */
/*
Author: Alex
Created: 2026-04-14
Modified: Eleanor 2026-05-16
*/
CREATE FUNCTION fnShowMenuItems()
	RETURNS @MenuItems table (
		MenuDishID int,
		DishID int,
		DishName varchar(50),
		MenuPrice money,
		LocationID int)
BEGIN
	INSERT @MenuItems
		SELECT	MenuDishID,
			d.DishId,
			d.DishName,
			FORMAT(MenuPrice, 'C', 'en-IE'),
			LocationID
		FROM MenuDishes md
		JOIN Dishes d
			ON md.DishID = d.DishID
		ORDER BY LocationID
	RETURN
END
GO

/* D - Show me the distribution of how orders are placed (in-person, online, phone).
		Show this as a sum of each, with an overall sum for all options. */
/*
Author: Alex
Created: 2026-04-14
Modified: Eleanor 2026-04-16
*/
IF OBJECT_ID('fnOrderDistribution') IS NOT NULL
	DROP FUNCTION fnOrderDistribution
GO

CREATE FUNCTION fnOrderDistribution()
	RETURNS @OrderDistribution table (
		TypeName varchar(50), TotalOrders int)
BEGIN
	INSERT @OrderDistribution
		SELECT	TypeName AS OrderType,
			COUNT(o.OrderTypeID) AS TotalOrders
		FROM Orders o
		JOIN OrderTypes ot
			ON o.OrderTypeID = ot.OrderTypeID
		GROUP BY ROLLUP (TypeName)
	RETURN
END