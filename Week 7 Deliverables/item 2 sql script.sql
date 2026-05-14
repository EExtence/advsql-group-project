-- task a
USE Restaurant;

GRANT EXECUTE ON OBJECT::dbo.spN_ChefDetails TO dbo;

-- task b
USE Restaurant;

GRANT VIEW DEFINITION ON OBJECT::dbo.spN_RecipeDetails TO RestaurantUser;

-- task c
USE Restaurant;

-- As we have a strored procedure called as spN_RecipeDetails in item 1 problem ((b) i)
-- I have changed this week 4 item 1 (problem (c) i) stored provedure name to spN_RecipeIngredientPrices
GRANT ALTER ON OBJECT::dbo.spN_RecipeIngredientPrices TO RestaurantAddDeleteDb;

-- task d
USE Restaurant;

GRANT TAKE OWNERSHIP ON OBJECT::DBO.spN_KitchenDetails TO RestaurantPower;

-- task e
USE Restaurant;

GRANT CONTROL ON OBJECT::dbo.spN_CustomerDetails TO RestaurantDoAnything;