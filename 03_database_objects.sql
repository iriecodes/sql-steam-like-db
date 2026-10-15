/*
    View, function, procedures, trigger, index. 
*/

-- VIEW: purchase details per user
-- Demonstrates: JOIN, non-correlated subquery
CREATE OR ALTER VIEW vw_UserPurchasesDetails AS
SELECT
    Users.username,
    Games.title,
    Purchases.price_paid,
    Games.price AS current_price,
    (SELECT AVG(price) FROM Games) AS avg_game_price  -- non-correlated subquery
FROM Purchases
JOIN Users ON Purchases.user_id = Users.user_id      -- join operation
JOIN Games ON Purchases.game_id = Games.game_id;
GO

-- FUNCTION: total amount a user has spent (inline table-valued)
CREATE OR ALTER FUNCTION fn_TotalSpentByUser (@user_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        u.username,
        TotalSpent = ISNULL(SUM(p.price_paid), 0)
    FROM Users u
    LEFT JOIN Purchases p
        ON u.user_id = p.user_id
    WHERE u.user_id = @user_id
    GROUP BY u.username
);
GO

-- PROCEDURE: add a friendship (order-independent, duplicate-safe)
CREATE OR ALTER PROCEDURE sp_AddFriend
    @user_id1 INT,
    @user_id2 INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @u1 INT, @u2 INT;

    -- Store the smaller id first so (1,5) and (5,1) are the same friendship
    IF @user_id1 < @user_id2
    BEGIN
        SET @u1 = @user_id1;
        SET @u2 = @user_id2;
    END
    ELSE
    BEGIN
        SET @u1 = @user_id2;
        SET @u2 = @user_id1;
    END;

    IF EXISTS (
        SELECT 1
        FROM Friends
        WHERE user_id1 = @u1 AND user_id2 = @u2
    )
    BEGIN
        SELECT
            CAST(0 AS BIT) AS Success,
            'Already friends :|' AS Message;
        RETURN;
    END;

    INSERT INTO Friends (user_id1, user_id2, since_date)
    VALUES (@u1, @u2, GETDATE());

    SELECT
        CAST(1 AS BIT) AS Success,
        'Friend added :)' AS Message;
END;
GO

-- PROCEDURE: games a user does not own
-- Demonstrates: set operation (EXCEPT)
CREATE OR ALTER PROCEDURE sp_GetGamesNotOwnedByUser
    @user_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT game_id, title
    FROM Games

    EXCEPT  -- set operation

    SELECT Games.game_id, Games.title
    FROM GameLibrary
    JOIN Games ON GameLibrary.game_id = Games.game_id
    WHERE GameLibrary.user_id = @user_id;
END;
GO

-- TRIGGER: a new purchase automatically adds the game to the user's library
CREATE OR ALTER TRIGGER trg_AddGameToLibrary
ON Purchases
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO GameLibrary (user_id, game_id, playtime_hours)
    SELECT i.user_id, i.game_id, 0
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 FROM GameLibrary gl
        WHERE gl.user_id = i.user_id
        AND gl.game_id = i.game_id
    );
END;
GO

-- INDEX: speeds up per-user purchase lookups (used by the view and function)
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'idx_Purchases_User')
    CREATE INDEX idx_Purchases_User ON Purchases(user_id);
GO
