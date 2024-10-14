CREATE DATABASE PRJShop
DROP DATABASE PRJShop
use master
USE PRJShop;
--Main table--
--Membership--
CREATE TABLE Membership(
	typeMember varchar(15) PRIMARY KEY,
	discount int
)
--Customer
CREATE TABLE Customer(
	userName varchar(25) PRIMARY KEY,
	password varchar(10),
	lastName varchar(25),
	phone char(10),
	email varchar(50),
	address varchar(255),
	typeMember varchar(15),
	FOREIGN KEY(typeMember) REFERENCES Membership(typeMember)
)
CREATE TABLE Visitor(
	visitorID char(50) PRIMARY KEY,
	date varchar(25)
)
--Order--
CREATE TABLE Orders(
	orderID char(50) PRIMARY KEY,
	dateOrder varchar(25),
	totalPrice int,
	userName varchar(25),
	FOREIGN KEY(userName) REFERENCES Customer(userName)
)
--Category--
CREATE TABLE ProductCategory(
	categoryID char(8) PRIMARY KEY,
	productCatogory varchar(25)
)
--Product
CREATE TABLE Product(
	productID char(8) PRIMARY KEY,
	categoryID char(8),
	productName nvarchar(255),
	stock tinyint,
	listPrice float,
	description nvarchar(255),
	sale float,
	isBestSelling varchar(5)
	FOREIGN KEY(categoryID) REFERENCES ProductCategory(categoryID)
)
--Admin--
CREATE TABLE Admin(
	adminID char(8) PRIMARY KEY,
	password varchar(15)
)
--Distributer--
CREATE TABLE Distributer(
	disID char(8) PRIMARY KEY,
	disName nvarchar(25),
	location nvarchar(25),
	hotline char(10)
)

--Delverry Express--

CREATE TABLE DeliveryExpress(
	deliveryID char(8) PRIMARY KEY,
	deliveryName varchar(25),
	phone char(10)
)
--Relation Table--
--Order List--
CREATE TABLE Include(
	orderID char(50),
	productID char(8),
	quantity int,
	PRIMARY KEY(orderID, productID),
	FOREIGN KEY(orderID) REFERENCES Orders(orderID),
	FOREIGN KEY(productID) REFERENCES product(productID)
)
--Ditribute--
CREATE TABLE Distribute(
	productID char(8),
	disID char(8),
	PRIMARY KEY(productID, disID),
	FOREIGN KEY(productID) REFERENCES product(productID),
	FOREIGN KEY(disID) REFERENCES distributer(disID)
)
--Delivery--
CREATE TABLE Delivery(
	deliveryID char(8),
	orderID char(50),
	Date datetime,
	PRIMARY KEY(deliveryID, orderID),
	FOREIGN KEY(deliveryID) REFERENCES DeliveryExpress(deliveryID),
	FOREIGN KEY(orderID) REFERENCES Orders(orderID)
)

--Adding admin--
INSERT INTO Admin VALUES ('admin1', '1234'),
					     ('admin2', '1234'),
					     ('admin3', '1234'),
					     ('admin4', '1234');
--Adding membership--
INSERT INTO Membership VALUES ('None', 0)
INSERT INTO Membership VALUES ('Bronze', 5)
INSERT INTO Membership VALUES ('Silver', 10)
INSERT INTO Membership VALUES ('Gold', 15)
INSERT INTO Membership VALUES ('Platinum', 25)
INSERT INTO Membership VALUES ('Diamond', 30)
--Adding Product Category--
INSERT INTO ProductCategory VALUES (1, 'Necklace')
INSERT INTO ProductCategory VALUES (2, 'Bracelet')
INSERT INTO ProductCategory VALUES (3, 'Ring')
INSERT INTO ProductCategory VALUES (4, 'Earring')
--Adding distributer--
INSERT INTO Distributer VALUES ('DIS01',N'TNJ',N'Ho Chi Minh','0998642531')
INSERT INTO Distributer VALUES ('DIS02',N'Jewelry LiLi',N'Ha Noi','0936451208')
INSERT INTO Distributer VALUES ('DIS03',N'Silver jewelry PNJ',N'Da Nang','0918745612')
INSERT INTO Distributer VALUES ('DIS04',N'KaT Jewelry',N'Ho Chi Minh','0969862510')
--Adding Delivery Express--
INSERT INTO DeliveryExpress VALUES ('DE01','GrabExpress','0363123658')
INSERT INTO DeliveryExpress VALUES ('DE02','LaHaMove','0331256410')
INSERT INTO DeliveryExpress VALUES ('DE03','SpeedUp','0325336985')

--Adding Product--
INSERT INTO Product VALUES('PRO16', 1, N'24K Gold Women''s Necklace PRO16', '100', '15000300',N'A timeless piece crafted from pure 24K gold, this women''s necklace exudes elegance and sophistication.',20, 'true')
INSERT INTO Product VALUES('PRO02', 1, N'24K Gold Dragon Phoenix Women''s Necklace PRO02', '100', '45000000',N'Combining the mythical dragon and phoenix, this 24K gold necklace is a symbol of harmony and balance, perfect for women who appreciate intricate designs.',0, 'true')
INSERT INTO Product VALUES('PRO03', 1, N'24K Gold Women''s Necklace Special PRO03', '100', '35000000',N'Elegant and luxurious, this 24K gold necklace is designed for women who appreciate unique and special jewelry pieces.',0, 'false')
INSERT INTO Product VALUES('PRO04', 1, N'Men''s Necklace Standard PRO04', '100', '21000000',N'Classic and timeless, this men''s necklace offers a sleek design suitable for everyday wear.',20, 'true')
INSERT INTO Product VALUES('PRO05', 2, N'Women''s Phoenix Bracelet PRO05', '100', '7000000',N'This stunning bracelet features a detailed phoenix design, symbolizing rebirth and immortality, perfect for women who love meaningful jewelry.
',0, 'true')
INSERT INTO Product VALUES('PRO06', 2, N'Men''s Dragon Bracelet PRO06', '100', '7300000',N'Bold and powerful, this men''s bracelet showcases a dragon motif, representing strength and courage.',20, 'false')
INSERT INTO Product VALUES('PRO07', 2, N'Ny Y Bracelet PRO07', '100', '3000000',N'A sophisticated bracelet that adds a touch of elegance to any outfit with its unique Ny Y design.',0, 'false')
INSERT INTO Product VALUES('PRO08', 2, N'14K Gold Gemstone Bracelet PRO08', '100', '7000000',N'Adorned with precious gemstones, this 14K gold bracelet is a dazzling accessory that complements any style.',30, 'false')
INSERT INTO Product VALUES('PRO09', 3, N'18K Gold Ruby Ring PRO09', '100', '15000000',N'Featuring a radiant ruby set in 18K gold, this ring is a symbol of passion and luxury.',0, 'true')
INSERT INTO Product VALUES('PRO10', 3, N'18K Gold Ruby Ring Standard PRO10', '100', '11000000',N'A beautiful 18K gold ring with a classic ruby setting, perfect for those who appreciate timeless elegance.',30, 'true')
INSERT INTO Product VALUES('PRO11', 3, N'18K Gold Citrine Ring PRO11', '100', '10000000',N'This exquisite ring features a vibrant citrine stone set in 18K gold, adding a pop of color to your jewelry collection.',10, 'true')
INSERT INTO Product VALUES('PRO12', 3, N'14K White Gold Pearl Ring PRO12', '100', '14000000',N'An elegant ring featuring a lustrous pearl set in 14K white gold, ideal for adding a touch of sophistication.',30, 'false')
INSERT INTO Product VALUES('PRO13', 4, N'18K Gold Earrings PRO13', '100', '5000000',N'Simple yet elegant, these 18K gold earrings are a versatile addition to any jewelry box.',10, 'true')
INSERT INTO Product VALUES('PRO14', 4, N'18K Gold Earrings PRO14', '100', '15000000',N'Another pair of exquisite 18K gold earrings, designed for those who love understated elegance.',10, 'false')
INSERT INTO Product VALUES('PRO15', 4, N'White Gold Earrings PRO15', '100', '15000000',N'Stylish and chic, these white gold earrings are perfect for adding a modern touch to any look.',0, 'true')

--Adding Customer--
INSERT INTO Customer VALUES ('john_doe', 'pwd1', N'Doe', '0123456789', 'john.doe@example.com', N'123 Elm St', 'None');
INSERT INTO Customer VALUES ('jane_smith', 'pwd2', N'Smith', '0987654321', 'jane.smith@example.com', N'456 Oak Ave', 'None');
INSERT INTO Customer VALUES ('will_jones', 'pwd3', N'Jones', '0112233445', 'will.jones@example.com', N'789 Pine Ln', 'None');
INSERT INTO Customer VALUES ('emma_watson', 'pwd4', N'Watson', '0223344556', 'emma.watson@example.com', N'101 Maple Rd', 'None');
INSERT INTO Customer VALUES ('oliver_brown', 'pwd5', N'Brown', '0334455667', 'oliver.brown@example.com', N'202 Birch Blvd', 'None');
INSERT INTO Customer VALUES ('lucas_davis', 'pwd6', N'Davis', '0445566778', 'lucas.davis@example.com', N'303 Cedar St', 'None');
INSERT INTO Customer VALUES ('mia_moore', 'pwd7', N'Moore', '0556677889', 'mia.moore@example.com', N'404 Spruce Dr', 'None');
INSERT INTO Customer VALUES ('liam_taylor', 'pwd8', N'Taylor', '0667788990', 'liam.taylor@example.com', N'505 Fir Ave', 'None');
INSERT INTO Customer VALUES ('sophia_clark', 'pwd9', N'Clark', '0778899001', 'sophia.clark@example.com', N'606 Willow Ct', 'None');
INSERT INTO Customer VALUES ('noah_hall', 'pwd10', N'Hall', '0889900112', 'noah.hall@example.com', N'707 Ash Ln', 'None');
--Adding distributer--
-- Insert random distributor IDs for each product
INSERT INTO Distribute (productID, disID) VALUES ('PRO16', CONCAT('DIS0', FLOOR(RAND() * 4) + 1));
INSERT INTO Distribute (productID, disID) VALUES ('PRO02', CONCAT('DIS0', FLOOR(RAND() * 4) + 1));
INSERT INTO Distribute (productID, disID) VALUES ('PRO03', CONCAT('DIS0', FLOOR(RAND() * 4) + 1));
INSERT INTO Distribute (productID, disID) VALUES ('PRO04', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO05', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO06', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO07', CONCAT('DIS0', FLOOR(RAND() * 4) + 1));
INSERT INTO Distribute (productID, disID) VALUES ('PRO08', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO09', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO10', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO11', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO12', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO13', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO14', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
INSERT INTO Distribute (productID, disID) VALUES ('PRO15', CONCAT('DIS0', FLOOR(RAND() * 4) + 1)); 
-----------------------------------------------------------------------------------------
SELECT * FROM DeliveryExpress
SELECT * FROM Admin
SELECT * FROM Distribute
SELECT * FROM Membership m INNER JOIN Customer c ON m.typeMember = c.typeMember
SELECT * FROM Product
SELECT * FROM Product p INNER JOIN ProductCategory pc On p.categoryID = pc.categoryID
SELECT * FROM ProductCategory
SELECT * FROM Product p INNER JOIN Distribute d ON p.productID = d.productID
						INNER JOIN Distributer dr ON d.disID = dr.disID
SELECT * FROM Customer c INNER JOIN Membership m ON c.typeMember = m.typeMember
SELECT * FROM Orders

