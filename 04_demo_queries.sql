/*
   Exercise everything 
*/

-- Inspect tables
SELECT * FROM Users;
SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Games;
SELECT * FROM Purchases;
SELECT * FROM GameLibrary;
SELECT * FROM Reviews;
SELECT * FROM Friends;

-- View
SELECT * FROM vw_UserPurchasesDetails;

-- Function
SELECT * FROM dbo.fn_TotalSpentByUser(1);

-- Procedure: add a friend (run twice to see the "Already friends" path)
EXEC sp_AddFriend 1, 5;

-- Procedure with set operation (EXCEPT)
EXEC sp_GetGamesNotOwnedByUser 1;

-- Trigger: buying a game should add it to the library with 0 hours
INSERT INTO Purchases (purchase_id, user_id, game_id, price_paid)
VALUES (100, 1, 30, 54.99);

SELECT * FROM GameLibrary WHERE user_id = 1 AND game_id = 30;
