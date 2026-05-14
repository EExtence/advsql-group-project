USE Restaurant;
GO

IF OBJECT_ID('fnGetFavoriteTableStats') IS NOT NULL
    DROP FUNCTION fnGetFavoriteTableStats;
GO

CREATE FUNCTION fnGetFavoriteTableStats()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        r.ReservationID,
        c.CustomerID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        r.PreferredTableID,
        r.ActualTableID,
        CASE 
            WHEN r.PreferredTableID = r.ActualTableID THEN 'Yes'
            ELSE 'No'
        END AS GotFavoriteTable
    FROM Reservations r
    JOIN Customers c 
      ON r.CustomerID = c.CustomerID
);
GO

-- Test 1

SELECT ReservationID, CustomerName, PreferredTableID, ActualTableID, GotFavoriteTable
FROM dbo.fnGetFavoriteTableStats()
ORDER by ReservationID;
GO

-- Test 2

SELECT GotFavoriteTable AS [Got the Preffered Table?],
COUNT(*) AS [Nmber of Reservations]
FROM fnGetFavoriteTableStats()
GROUP BY GotFavoriteTable;
GO