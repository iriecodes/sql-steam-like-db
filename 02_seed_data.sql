/* 
    Sample data (AI-generated)
    Run after 01_schema.sql
*/

-- Users
INSERT INTO Users (user_id, username, email, created_at) VALUES
(1,'alice','alice@example.com','2024-01-01'),
(2,'bob','bob@example.com','2024-01-02'),
(3,'charlie','charlie@example.com','2024-01-03'),
(4,'david','david@example.com','2024-01-04'),
(5,'eve','eve@example.com','2024-01-05'),
(6,'frank','frank@example.com','2024-01-06'),
(7,'grace','grace@example.com','2024-01-07'),
(8,'henry','henry@example.com','2024-01-08'),
(9,'isabel','isabel@example.com','2024-01-09'),
(10,'jack','jack@example.com','2024-01-10'),
(11,'karen','karen@example.com','2024-01-11'),
(12,'leo','leo@example.com','2024-01-12'),
(13,'mia','mia@example.com','2024-01-13'),
(14,'nathan','nathan@example.com','2024-01-14'),
(15,'olivia','olivia@example.com','2024-01-15'),
(16,'paul','paul@example.com','2024-01-16'),
(17,'quinn','quinn@example.com','2024-01-17'),
(18,'rachel','rachel@example.com','2024-01-18'),
(19,'sam','sam@example.com','2024-01-19'),
(20,'tina','tina@example.com','2024-01-20'),
(21,'umar','umar@example.com','2024-01-21'),
(22,'victor','victor@example.com','2024-01-22'),
(23,'wendy','wendy@example.com','2024-01-23'),
(24,'xavier','xavier@example.com','2024-01-24'),
(25,'yara','yara@example.com','2024-01-25'),
(26,'zane','zane@example.com','2024-01-26'),
(27,'amber','amber@example.com','2024-01-27'),
(28,'blake','blake@example.com','2024-01-28'),
(29,'cody','cody@example.com','2024-01-29'),
(30,'diana','diana@example.com','2024-01-30');

-- Developers
INSERT INTO Developers (developer_id, name) VALUES
(1,'DevStudio A'),(2,'PixelWorks'),(3,'NextGen Games'),(4,'Indie Forge'),(5,'AAA Studios'),
(6,'Skyline Devs'),(7,'Quantum Studio'),(8,'BlueByte'),(9,'IronClad Games'),(10,'Nova Interactive'),
(11,'Crimson Labs'),(12,'Aurora Dev Co'),(13,'EchoWorks'),(14,'Vertex Games'),(15,'Nebula Studio'),
(16,'Fusion Forge'),(17,'Titan Devs'),(18,'DreamPixel'),(19,'Hyperion Games'),(20,'Stellar Works'),
(21,'Orbit Dev'),(22,'Zenith Studios'),(23,'Lunar Labs'),(24,'Firefly Devs'),(25,'Mythic Forge'),
(26,'Cosmos Creations'),(27,'Phantom Devs'),(28,'Omega Interactive'),(29,'PixelStorm'),(30,'Atlas Games');

-- Publishers
INSERT INTO Publishers (publisher_id, name) VALUES
(1,'Global Publish'),(2,'Epic House'),(3,'GameWorld Inc'),(4,'IndiePub'),(5,'MegaPublishers'),
(6,'UltraPublish'),(7,'Skyline Pub'),(8,'Quantum Publishing'),(9,'BlueOcean Games'),(10,'IronGate Publishing'),
(11,'Nova House'),(12,'Crimson Publishing'),(13,'Aurora Pub'),(14,'Echo Publish'),(15,'Vertex Publishing'),
(16,'Nebula Pub'),(17,'Fusion Publishing'),(18,'Titan House'),(19,'DreamPub'),(20,'Hyperion Publishing'),
(21,'Stellar Publishing'),(22,'Orbit Publishing'),(23,'Zenith Publishing'),(24,'Lunar Publishing'),
(25,'Firefly Publishing'),(26,'Mythic Publishing'),(27,'Cosmos Publishing'),(28,'Phantom Publishing'),
(29,'Omega Publishing'),(30,'Atlas Publishing');

-- Games
INSERT INTO Games (game_id, title, price, developer_id, publisher_id) VALUES
(1,'Space Adventure',29.99,1,1),
(2,'Pixel Quest',19.99,2,2),
(3,'Future Racer',39.99,3,3),
(4,'Indie Puzzle',9.99,4,4),
(5,'War Zone X',59.99,5,5),
(6,'Sky Battle',24.99,6,6),
(7,'Quantum Shift',34.99,7,7),
(8,'Ocean Explorer',14.99,8,8),
(9,'Iron War',44.99,9,9),
(10,'Nova Run',19.99,10,10),
(11,'Crimson Night',29.99,11,11),
(12,'Aurora Skies',22.99,12,12),
(13,'Echo Drift',18.99,13,13),
(14,'Vertex Climb',12.99,14,14),
(15,'Nebula Quest',39.99,15,15),
(16,'Fusion Core',27.99,16,16),
(17,'Titan Siege',49.99,17,17),
(18,'Dream Escape',16.99,18,18),
(19,'Hyper Dash',21.99,19,19),
(20,'Stellar Voyage',33.99,20,20),
(21,'Orbit Jumper',11.99,21,21),
(22,'Zenith Blade',45.99,22,22),
(23,'Lunar Mission',28.99,23,23),
(24,'Firefly Run',13.99,24,24),
(25,'Mythic Legends',59.99,25,25),
(26,'Cosmos Arena',37.99,26,26),
(27,'Phantom Strike',41.99,27,27),
(28,'Omega Protocol',47.99,28,28),
(29,'Pixel Storm X',23.99,29,29),
(30,'Atlas Rising',54.99,30,30);

-- Purchases: users 1-5 have hand-written multi-game histories
INSERT INTO Purchases (purchase_id, user_id, game_id, purchase_date, price_paid) VALUES
-- User 1 (5 games)
(1,1,1,'2024-02-01',29.99),
(2,1,2,'2024-02-02',19.99),
(3,1,3,'2024-02-03',35.99),
(4,1,4,'2024-02-04',9.99),
(5,1,5,'2024-02-05',49.99),
-- User 2 (4 games)
(6,2,2,'2024-02-01',19.99),
(7,2,6,'2024-02-02',24.99),
(8,2,7,'2024-02-03',30.99),
(9,2,8,'2024-02-04',14.99),
-- User 3 (6 games)
(10,3,3,'2024-02-01',35.99),
(11,3,9,'2024-02-02',39.99),
(12,3,10,'2024-02-03',19.99),
(13,3,11,'2024-02-04',29.99),
(14,3,12,'2024-02-05',20.99),
(15,3,13,'2024-02-06',18.99),
-- User 4 (3 games)
(16,4,4,'2024-02-01',9.99),
(17,4,14,'2024-02-02',12.99),
(18,4,15,'2024-02-03',35.99),
-- User 5 (7 games)
(19,5,5,'2024-02-01',49.99),
(20,5,16,'2024-02-02',27.99),
(21,5,17,'2024-02-03',44.99),
(22,5,18,'2024-02-04',16.99),
(23,5,19,'2024-02-05',21.99),
(24,5,20,'2024-02-06',33.99),
(25,5,21,'2024-02-07',11.99);

-- Users 6-30 each own the game matching their id at full price, so every
-- review below comes from a user who actually purchased the game.
INSERT INTO Purchases (purchase_id, user_id, game_id, purchase_date, price_paid)
SELECT 25 + (u.user_id - 5), u.user_id, g.game_id, '2024-02-10', g.price
FROM Users u
JOIN Games g ON g.game_id = u.user_id
WHERE u.user_id BETWEEN 6 AND 30;

-- GameLibrary (random playtime 0-30 hrs).
-- Note: RAND() is evaluated once per query in SQL Server, so NEWID() is used
-- to get a different value on every row.
INSERT INTO GameLibrary (user_id, game_id, playtime_hours)
SELECT
    user_id,
    game_id,
    CAST(ABS(CHECKSUM(NEWID())) % 301 / 10.0 AS DECIMAL(10,2))
FROM Purchases;

-- Reviews
INSERT INTO Reviews (review_id, user_id, game_id, rating, comment) VALUES
(1,1,1,5,'Amazing game!'),
(2,2,2,4,'Fun and engaging'),
(3,3,3,3,'Good but has bugs'),
(4,4,4,4,'Nice indie experience'),
(5,5,5,5,'Top tier action'),
(6,6,6,4,'Solid gameplay'),
(7,7,7,5,'Fantastic mechanics'),
(8,8,8,3,'Relaxing but short'),
(9,9,9,4,'Great battles'),
(10,10,10,3,'Average experience'),
(11,11,11,5,'Loved the story'),
(12,12,12,4,'Beautiful visuals'),
(13,13,13,3,'Needs polish'),
(14,14,14,4,'Fun climb mechanics'),
(15,15,15,5,'Amazing world'),
(16,16,16,4,'Cool systems'),
(17,17,17,5,'Epic scale'),
(18,18,18,3,'Good casual game'),
(19,19,19,4,'Fast and fun'),
(20,20,20,5,'Incredible journey'),
(21,21,21,3,'Simple gameplay'),
(22,22,22,5,'Top tier combat'),
(23,23,23,4,'Nice missions'),
(24,24,24,3,'Decent runner'),
(25,25,25,5,'Legendary game'),
(26,26,26,4,'Great arena fights'),
(27,27,27,4,'Smooth gameplay'),
(28,28,28,5,'Very immersive'),
(29,29,29,3,'Arcade fun'),
(30,30,30,5,'Masterpiece');

-- Friends (stored with the smaller id first)
INSERT INTO Friends (user_id1, user_id2, since_date) VALUES
(1,2,'2024-03-01'),(1,3,'2024-03-02'),(2,4,'2024-03-03'),(3,5,'2024-03-04'),(4,5,'2024-03-05'),
(6,7,'2024-03-06'),(7,8,'2024-03-07'),(8,9,'2024-03-08'),(9,10,'2024-03-09'),(10,11,'2024-03-10'),
(11,12,'2024-03-11'),(12,13,'2024-03-12'),(13,14,'2024-03-13'),(14,15,'2024-03-14'),(15,16,'2024-03-15'),
(16,17,'2024-03-16'),(17,18,'2024-03-17'),(18,19,'2024-03-18'),(19,20,'2024-03-19'),(20,21,'2024-03-20'),
(21,22,'2024-03-21'),(22,23,'2024-03-22'),(23,24,'2024-03-23'),(24,25,'2024-03-24'),(25,26,'2024-03-25'),
(26,27,'2024-03-26'),(27,28,'2024-03-27'),(28,29,'2024-03-28'),(29,30,'2024-03-29'),(1,30,'2024-03-30');
GO
