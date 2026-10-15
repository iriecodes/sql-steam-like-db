/*
    Steam-style store database (T-SQL)
    Drops (child -> parent order) and recreates all tables
*/

DROP TABLE IF EXISTS Friends;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS GameLibrary;
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Games;
DROP TABLE IF EXISTS Developers;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Users;
GO

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATE DEFAULT GETDATE()
);

CREATE TABLE Developers (
    developer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    developer_id INT,
    publisher_id INT,
    FOREIGN KEY (developer_id) REFERENCES Developers(developer_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    purchase_date DATE DEFAULT GETDATE(),
    price_paid DECIMAL(10,2) NOT NULL CHECK (price_paid >= 0),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE GameLibrary (
    user_id INT,
    game_id INT,
    playtime_hours DECIMAL(10,2) DEFAULT 0 CHECK (playtime_hours >= 0),
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(MAX),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

-- Friendships are stored once, with user_id1 < user_id2 (see sp_AddFriend)
CREATE TABLE Friends (
    user_id1 INT,
    user_id2 INT,
    since_date DATE,
    PRIMARY KEY (user_id1, user_id2),
    FOREIGN KEY (user_id1) REFERENCES Users(user_id),
    FOREIGN KEY (user_id2) REFERENCES Users(user_id),
    CHECK (user_id1 <> user_id2)
);
GO
