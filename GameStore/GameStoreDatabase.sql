-- Switch to master database
USE master;

-- Create the GameStore database
CREATE DATABASE GameStore;
USE GameStore;
drop database GameStore

-- Create Users table
CREATE TABLE Users (
    userId INT PRIMARY KEY IDENTITY(1,1),
    userName VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phoneNumber VARCHAR(15),
	role VARCHAR(10) default 'customer' NOT NULL
);

-- Create Games table
CREATE TABLE Games (
    gameId INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(200) NOT NULL,
    platform VARCHAR(100),
    publisher VARCHAR(100),
    publication_year INT,
	category varchar(100),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    description TEXT,
    image_game VARCHAR(255),
	status int DEFAULT 1
);

CREATE TABLE Orders (
    orderId VARCHAR(50) PRIMARY KEY,
    userId INT,
    order_date DATETIME DEFAULT GETDATE(),
    status VARCHAR(50) DEFAULT 'pending',
    total_amount DECIMAL(10,2),
	firstName VARCHAR(20) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	address VARCHAR(50) NOT NULL,
    FOREIGN KEY (userId) REFERENCES Users(userId)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    orderId VARCHAR(50),
    gameId INT,	
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (orderId, gameId),
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (gameId) REFERENCES Games(gameId)
);

-- Create Cart table
CREATE TABLE Cart (
    gameId INT,
	userId INT,
    quantity INT NOT NULL,
	PRIMARY KEY (userId, gameId),
	FOREIGN KEY (gameId) REFERENCES Games(gameId),
	FOREIGN KEY (userId) REFERENCES Users(userId)
);

-- Create Favourites table
CREATE TABLE Favourites (
    userId INT,
    gameId INT,
	PRIMARY KEY (userId, gameId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (gameId) REFERENCES Games(gameId)
);

insert into Users (userName, password, email, phoneNumber, role) 
values 
	('admin', '123', 'test1@gmail.com', '0123456789', 'admin'),
	('customer', '123', 'test2@gmail.com', '0123456789', 'customer');

INSERT INTO Games (name, platform, publisher, publication_year, category, price, stock_quantity, description, image_game)
VALUES
-- PS4
('The Last of Us Part II', 'PS4', 'Sony Interactive Entertainment', 2020, 'Action-Adventure', 59.99, 10, 'An emotional journey through a post-apocalyptic world.', './Image/img-books/the_last_of_us_part_ii.jpg'),
('Ghost of Tsushima', 'PS4', 'Sony Interactive Entertainment', 2020, 'Action-Adventure', 59.99, 8, 'A samurai epic set in feudal Japan.', './Image/img-books/ghost_of_tsushima.jpg'),
('Final Fantasy VII Remake', 'PS4', 'Square Enix', 2020, 'JRPG', 59.99, 14, 'A modern retelling of the classic RPG.', './Image/img-books/final_fantasy_vii_remake.jpg'),
('Death Stranding', 'PS4', 'Sony Interactive Entertainment', 2019, 'Action', 49.99, 10, 'An enigmatic game about building connections in a fractured world.', './Image/img-books/death_stranding.jpg'),
('Persona 5 Royal', 'PS4', 'Atlus', 2020, 'JRPG', 59.99, 8, 'An enhanced version of the critically acclaimed Persona 5.', './Image/img-books/persona_5_royal.jpg'),

-- PS5
('Horizon Forbidden West', 'PS5', 'Sony Interactive Entertainment', 2022, 'Action RPG', 69.99, 12, 'A breathtaking open-world adventure with robotic creatures.', './Image/img-books/horizon_forbidden_west.jpg'),
('Ratchet & Clank: Rift Apart', 'PS5', 'Sony Interactive Entertainment', 2021, 'Platformer', 69.99, 15, 'A visually stunning platformer with dimension-hopping mechanics.', './Image/img-books/ratchet_and_clank_rift_apart.jpg'),
('Spider-Man: Miles Morales', 'PS5', 'Sony Interactive Entertainment', 2020, 'Action-Adventure', 49.99, 18, 'A superhero adventure with the new Spider-Man, Miles Morales.', './Image/img-books/spider_man_miles_morales.jpg'),
('Gran Turismo 7', 'PS5', 'Sony Interactive Entertainment', 2022, 'Racing', 69.99, 5, 'A stunning racing simulation game with a variety of cars and tracks.', './Image/img-books/gran_turismo_7.jpg'),
('Elden Ring', 'PS5', 'Bandai Namco Entertainment', 2022, 'Action RPG', 59.99, 20, 'An epic fantasy RPG from the creators of Dark Souls.', './Image/img-books/elden_ring.jpg'),

-- Switch
('The Legend of Zelda: Breath of the Wild', 'Switch', 'Nintendo', 2017, 'Action-Adventure', 59.99, 25, 'An expansive open-world adventure set in the land of Hyrule.', './Image/img-books/breath_of_the_wild.jpg'),
('Animal Crossing: New Horizons', 'Switch', 'Nintendo', 2020, 'Simulation', 59.99, 30, 'A relaxing life simulation game where you build and decorate your own island.', './Image/img-books/animal_crossing_new_horizons.jpg'),
('Super Mario Odyssey', 'Switch', 'Nintendo', 2017, 'Platformer', 59.99, 20, 'A 3D platformer featuring Mario’s globe-trotting adventures.', './Image/img-books/super_mario_odyssey.jpg'),
('Splatoon 3', 'Switch', 'Nintendo', 2022, 'Shooter', 59.99, 22, 'A vibrant and fast-paced team-based shooter with ink-based combat.', './Image/img-books/splatoon_3.jpg'),
('Mario Kart 8 Deluxe', 'Switch', 'Nintendo', 2017, 'Racing', 59.99, 25, 'The ultimate kart racing experience with a variety of tracks and characters.', './Image/img-books/mario_kart_8_deluxe.jpg'),

-- Xbox
('Halo Infinite', 'Xbox', 'Xbox Game Studios', 2021, 'Shooter', 59.99, 15, 'The next chapter in the legendary Halo series.', './Image/img-books/halo_infinite.jpg'),
('Forza Horizon 5', 'Xbox', 'Microsoft Studios', 2021, 'Racing', 59.99, 20, 'An open-world racing game set in a visually stunning Mexico.', './Image/img-books/forza_horizon_5.jpg'),
('Sea of Thieves', 'Xbox', 'Xbox Game Studios', 2018, 'Action-Adventure', 39.99, 18, 'A pirate-themed multiplayer adventure with exploration and treasure hunting.', './Image/img-books/sea_of_thieves.jpg'),
('Gears 5', 'Xbox', 'Xbox Game Studios', 2019, 'Shooter', 49.99, 10, 'The next installment in the Gears of War series with new characters and stories.', './Image/img-books/gears_5.jpg'),
('Ori and the Will of the Wisps', 'Xbox', 'Xbox Game Studios', 2020, 'Platformer', 29.99, 15, 'A beautifully crafted platformer with emotional storytelling and stunning visuals.', './Image/img-books/ori_and_the_will_of_the_wisps.jpg'),

-- Additional Games
('Psychonauts 2', 'Xbox', 'Xbox Game Studios', 2021, 'Platformer', 59.99, 12, 'A sequel to the beloved cult classic, full of imaginative worlds and humor.', './Image/img-books/psychonauts_2.jpg'),
('A Plague Tale: Requiem', 'Xbox', 'Focus Entertainment', 2022, 'Action-Adventure', 59.99, 8, 'A dark and gripping sequel to A Plague Tale: Innocence.', './Image/img-books/a_plague_tale_requiem.jpg'),
('The Outer Worlds', 'Xbox', 'Private Division', 2019, 'RPG', 39.99, 10, 'A space-faring RPG with a unique story and deep character customization.', './Image/img-books/the_outer_worlds.jpg'),
('Hades', 'Switch', 'Supergiant Games', 2020, 'Rogue-like', 24.99, 20, 'A critically acclaimed rogue-like dungeon crawler with a rich narrative.', './Image/img-books/hades.jpg'),
('Hollow Knight', 'Switch', 'Team Cherry', 2018, 'Metroidvania', 14.99, 18, 'A beautifully crafted Metroidvania game with intricate exploration and combat.', './Image/img-books/hollow_knight.jpg'),
('Stardew Valley', 'Switch', 'ConcernedApe', 2017, 'Simulation', 14.99, 22, 'A charming farming simulator with a focus on community and customization.', './Image/img-books/stardew_valley.jpg'),
('Cuphead', 'Switch', 'Studio MDHR', 2018, 'Platformer', 19.99, 15, 'A visually unique platformer with challenging gameplay and a 1930s cartoon style.', './Image/img-books/cuphead.jpg'),
('Celeste', 'Switch', 'Maddy Makes Games', 2018, 'Platformer', 19.99, 20, 'A critically acclaimed platformer with tight controls and an emotional story.', './Image/img-books/celeste.jpg'),

-- More PS4 games
('God of War', 'PS4', 'Sony Interactive Entertainment', 2018, 'Action-Adventure', 39.99, 12, 'A brutal and emotionally charged action-adventure game.', './Image/img-books/god_of_war.jpg'),
('Uncharted 4: A Thief’s End', 'PS4', 'Sony Interactive Entertainment', 2016, 'Action-Adventure', 49.99, 8, 'A cinematic and action-packed conclusion to Nathan Drake’s adventures.', './Image/img-books/uncharted_4.jpg'),

-- More PS5 games
('Demon’s Souls', 'PS5', 'Sony Interactive Entertainment', 2020, 'Action RPG', 69.99, 10, 'A remake of the classic action RPG with stunning graphics.', './Image/img-books/demons_souls.jpg'),
('Returnal', 'PS5', 'Sony Interactive Entertainment', 2021, 'Rogue-like', 69.99, 8, 'A challenging rogue-like shooter with a gripping story.', './Image/img-books/returnal.jpg'),

-- More Switch games
('Fire Emblem: Three Houses', 'Switch', 'Nintendo', 2019, 'Strategy RPG', 59.99, 15, 'A tactical RPG with deep story and character interactions.', './Image/img-books/fire_emblem_three_houses.jpg'),
('Xenoblade Chronicles 2', 'Switch', 'Nintendo', 2017, 'JRPG', 59.99, 12, 'A vast open-world RPG with rich storytelling and combat.', './Image/img-books/xenoblade_chronicles_2.jpg');

SELECT * FROM Games
SELECT * FROM Cart
SELECT * FROM Orders, OrderItems WHERE Orders.orderId = OrderItems.orderId
SELECT * FROM Orders INNER JOIN OrderItems ON Orders.orderId = OrderItems.orderId  INNER JOIN Games ON OrderItems.gameId
 = Games.gameId 
SELECT * FROM Users
SELECT g.*
            FROM Cart c
            JOIN Games g ON c.gameId = g.gameId
            WHERE c.userId = '2' ;

SELECT quantity From Cart Where gameId = 32 AND userId = 2 UPDATE Cart SET quantity = 3;
SELECT * FROM Orders INNER JOIN OrderItems ON Orders.orderId = OrderItems.orderId  INNER JOIN Games ON OrderItems.gameId = Games.gameId
SELECT * FROM Orders
SELECT * FROM OrderItems
SELECT * FROM Users