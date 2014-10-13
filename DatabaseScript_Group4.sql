#########################
# RUHungry Database Script
#########################
DROP DATABASE IF EXISTS ruhungry;
CREATE DATABASE ruhungry;
 
USE ruhungry;
 
#############
# Create Tables
#############
 
#Create customer_info table
DROP TABLE  IF EXISTS customer_info;
CREATE TABLE customer_info (
  User_ID VARCHAR(50) NOT NULL,
  Username VARCHAR(50) NULL,
  First_Name VARCHAR(30) NULL,
  Last_Name VARCHAR(30) NULL,
  Email VARCHAR(50) NULL,
  Customer_Password VARCHAR(50) NULL,
  PRIMARY KEY (User_ID));
 
#Create administrator_users table
DROP TABLE IF EXISTS administrator_users;
CREATE TABLE administrator_users (
  Admin_ID VARCHAR(50) NOT NULL,
  Username VARCHAR(50) NULL,
  First_Name VARCHAR(30) NULL,
  Last_Name VARCHAR(30) NULL,
  Email VARCHAR(50) NULL,
  Admin_Password VARCHAR(50) NULL,
  PRIMARY KEY (Admin_ID));
 
#Create restaurant_info table
DROP TABLE IF EXISTS restaurant_info;
CREATE TABLE restaurant_info (
  Restrt_ID VARCHAR(50) NOT NULL,
  Restrt_Name VARCHAR(50) NOT NULL,
  Area VARCHAR(50) NULL,
  Ship_Hours VARCHAR(50) NULL,
  Address VARCHAR(100) NULL,
  Restrt_Type VARCHAR(50) NULL,
  Description VARCHAR(200) NULL,
  Img VARCHAR(200) NULL,
  PRIMARY KEY (Restrt_ID));
 
#Create inventory_info table
DROP TABLE IF EXISTS inventory_info;
CREATE TABLE inventory_info (
  Item_ID VARCHAR(50) NOT NULL,
  Restrt_ID VARCHAR(50) NULL,
  Item_Name VARCHAR(50) NULL,
  Item_Description VARCHAR(200) NULL,
  Price FLOAT NULL,
  Date_Added DATETIME NULL,
  Category VARCHAR(50) NULL,
  
  PRIMARY KEY (Item_ID),
  FOREIGN key (Restrt_ID) references restaurant_info(Restrt_ID));
 
#Create item_reviews table
DROP TABLE IF EXISTS item_reviews;
CREATE TABLE item_reviews (
  Review_ID VARCHAR(50) NOT NULL,
  User_ID VARCHAR(50) NULL,
  Item_ID VARCHAR(50) NULL,
  Review_Date DATETIME NULL,
  Rate INT NULL,
  Description VARCHAR(200) NULL,
  PRIMARY KEY (Review_ID),
  FOREIGN key (User_ID) references customer_info(User_ID),
  FOREIGN key (Item_ID) references inventory_info(Item_ID));
 
#Create shopping_cart_info table
DROP TABLE IF EXISTS shopping_cart_info;
CREATE TABLE shopping_cart_info (
  User_ID VARCHAR(50) NOT NULL,
  Item_ID VARCHAR(50) NULL,
  Restrt_ID VARCHAR(50) NULL,
  Quantity INT NULL,
  PRIMARY KEY (User_ID),
  FOREIGN key (Item_ID) references inventory_info(Item_ID),
  FOREIGN key (Restrt_ID) references restaurant_info(Restrt_ID));
 
#Create credit_card_hotlist table
DROP TABLE IF EXISTS credit_card_hotlist;
CREATE TABLE credit_card_hotlist (
  Card_ID VARCHAR(50) NOT NULL,
  User_ID VARCHAR(50) NULL,
  Card_Account VARCHAR(50) NULL,
  Card_Type VARCHAR(15) NULL,
  Card_Holder VARCHAR(50) NULL,
  Card_Expire DATETIME NULL,
  Bill_Address VARCHAR(150) NULL,
  PRIMARY KEY (Card_ID),
  FOREIGN key (User_ID) references customer_info (User_ID));
 
#Create checkout_info table
DROP TABLE IF EXISTS checkout_info;
CREATE TABLE checkout_info (
  Order_ID VARCHAR(50) NOT NULL,
  User_ID VARCHAR(50) NULL,
  Item_ID VARCHAR(50) NULL,
  Restrt_ID VARCHAR(50) NULL,
  Card_ID VARCHAR(50) NULL,
  Shipping_Address VARCHAR(150) NULL,
  Checkout_Date DATETIME NULL,
  Price FLOAT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN key (User_ID) references customer_info (User_ID),
  FOREIGN key (Card_ID) references credit_card_hotlist (Card_ID),
  FOREIGN key (Item_ID) references inventory_info (Item_ID),
  FOREIGN key (Restrt_ID) references restaurant_info (Restrt_ID));
 
#Create purchase_alerts table
DROP TABLE IF EXISTS purchase_alerts;
CREATE TABLE purchase_alerts (
  Alert_ID VARCHAR(50) NOT NULL,
  Alert_Info VARCHAR(150) NULL,
  Alert_Time DATETIME NULL,
  Card_ID VARCHAR(50) NULL,
  IP_Record VARCHAR(50) NULL,
  PRIMARY KEY (Alert_ID),
  FOREIGN key (Card_ID) references credit_card_hotlist (Card_ID));


#######################
# Insert Test Data
#######################

# customer_info test data
INSERT INTO customer_info (User_ID, Username, First_Name, Last_Name, Email, Customer_Password) VALUES ('001', 'lintianlang', 'Tianlang', 'Lin', 'terrylin@gwu.edu', 'test123');
INSERT INTO customer_info (User_ID, Username, First_Name, Last_Name, Email, Customer_Password) VALUES ('002', 'chenlongjiu', 'Longjiu', 'Chen', 'stanley_chen@gwu.edu', 'test123');
INSERT INTO customer_info (User_ID, Username, First_Name, Last_Name, Email, Customer_Password) VALUES ('003', 'daierzheng', 'Erzheng', 'Dai', 'daierzheng@gwu.edu', 'test123');
INSERT INTO customer_info (User_ID, Username, First_Name, Last_Name, Email, Customer_Password) VALUES ('004', 'zhangzhenlin', 'Zhenlin', 'Zhang', 'Zarek@gwu.edu', 'test123');

# administrator_users test data
INSERT INTO administrator_users (Admin_ID, Username, First_Name, Last_Name, Email, Admin_Password) VALUES ('001', 'admin', 'Tianlang', 'Lin', 'terrylin@gwu.edu', 'admin');

# restaurant_info test data
INSERT INTO restaurant_info (Restrt_ID, Restrt_Name, Area, Ship_Hours, Address, Restrt_Type, Description) VALUES ('001', 'XOTaste', 'Arlington', '1', '12451 Army Navy Drive, Arlington, VA', 'Chinese', 'Szechwan cuisine');
INSERT INTO restaurant_info (Restrt_ID, Restrt_Name, Area, Ship_Hours, Address, Restrt_Type, Description) VALUES ('002', 'YoungChow', 'Arlington', '1', '1251 28th, Arlington, VA', 'Chinese', 'Shanghai cuisine');
INSERT INTO restaurant_info (Restrt_ID, Restrt_Name, Area, Ship_Hours, Address, Restrt_Type, Description) VALUES ('003', 'Sakura', 'Arlington', '1', '2321 13th, Arlington, VA', 'Japanese', 'Sushi');

# inventory_info test data
INSERT INTO inventory_info (Item_ID, Restrt_ID, Item_Name, Item_Description, Price, Date_Added, Category) VALUES ('001', '001', 'KongBaoChicken', 'ChickenwithPepper', '12.00', '2014-10-05 00:00:00', 'Chinese');
INSERT INTO inventory_info (Item_ID, Restrt_ID, Item_Name, Item_Description, Price, Date_Added, Category) VALUES ('002', '002', 'BeijingBeef', 'BeefwithMushroom', '12.00', '2014-10-05 00:00:00', 'Chinese');
INSERT INTO inventory_info (Item_ID, Restrt_ID, Item_Name, Item_Description, Price, Date_Added, Category) VALUES ('003', '003', 'Hunanpork', 'SautePork', '12.00', '2014-10-05 00:00:00', 'Chinese');

# item_reviews test data
INSERT item_reviews (Review_ID, User_ID, Item_ID, Review_Date, Rate, Description) VALUES ('004001001', '004', '001', '2014-10-5 12:00:00', '4', 'SPICY enough!!!');
INSERT item_reviews (Review_ID, User_ID, Item_ID, Review_Date, Rate, Description) VALUES ('004002001', '004', '002', '2014-10-5 12:00:00', '5', 'Yumme!!!');
INSERT item_reviews (Review_ID, User_ID, Item_ID, Review_Date, Rate, Description) VALUES ('004003001', '004', '003', '2014-10-5 12:00:00', '4', 'So delicious!');

#shopping_cart_info test data
INSERT INTO shopping_cart_info (User_ID , Item_ID , Restrt_ID , Quantity) VALUES ('001', '002', '001', '1');

INSERT INTO shopping_cart_info (User_ID , Item_ID , Restrt_ID , Quantity) VALUES ('002', '003', '001', '1');
INSERT INTO shopping_cart_info (User_ID , Item_ID , Restrt_ID , Quantity) VALUES ('003', '001', '001', '1');

# credit_card_hotlist test data
INSERT INTO credit_card_hotlist (Card_ID, User_ID, Card_Account, Card_Type, Card_Holder, Card_Expire, Bill_Address) VALUES ('00001', '001', '0000012345678901', 'visa', 'Tianlang Lin', '2018-10-05 00:00:00', '1400 S Joyce St, Arlington, VA 22202');
INSERT INTO credit_card_hotlist (Card_ID, User_ID, Card_Account, Card_Type, Card_Holder, Card_Expire, Bill_Address) VALUES ('00002', '002', '0000012345678902', 'visa', 'Longjiu Chen', '2018-09-05 00:00:00', '1500 S Joyce St, Arlington, VA 22202');
INSERT INTO credit_card_hotlist (Card_ID, User_ID, Card_Account, Card_Type, Card_Holder, Card_Expire, Bill_Address) VALUES ('00003', '003', '0000012345678903', 'visa', 'Erzheng Dai', '2018-07-05 00:00:00', '1700 S Eads St, Arlington, VA 22202');
INSERT INTO credit_card_hotlist (Card_ID, User_ID, Card_Account, Card_Type, Card_Holder, Card_Expire, Bill_Address) VALUES ('00004', '004', '0000012345678904', 'visa', 'Zhenlin Zhang', '2018-06-05 00:00:00', '1900 S Eads St, Arlington, VA 22202');

#checkout_info test data
INSERT INTO checkout_info (Order_ID, User_ID, Item_ID, Restrt_ID, Card_ID, Shipping_Address, Checkout_Date, Price) VALUES('000000011', '004', '001', '001', '00004', '1111 Pentagon',  '2014-10-05 20:10:00', '23.21');
INSERT INTO checkout_info (Order_ID, User_ID, Item_ID, Restrt_ID, Card_ID, Shipping_Address, Checkout_Date, Price) VALUES('000000012', '004', '002', '001', '00004', '1111 Pentagon', '2014-10-03 12:13:00', '12.21');
INSERT INTO checkout_info (Order_ID, User_ID, Item_ID, Restrt_ID, Card_ID, Shipping_Address, Checkout_Date, Price) VALUES('000000013', '004', '002', '001', '00004', '1111 Pentagon', '2014-10-04 15:09:00', '32.21');

#purchase_alerts test data
INSERT INTO purchase_alerts (Alert_ID, Alert_Info, Alert_Time, Card_ID, IP_Record) VALUES('000001', 'Verification Failed', '2014-10-04 13:09:00', '00004', '122.21.10.76');
INSERT INTO purchase_alerts (Alert_ID, Alert_Info, Alert_Time, Card_ID, IP_Record) VALUES('000002', 'Transfer Failed', '2014-10-05 11:45:00', '00001', '112.17.102.19');
INSERT INTO purchase_alerts (Alert_ID, Alert_Info, Alert_Time, Card_ID, IP_Record) VALUES('000003', 'Transfer Failed', '2014-10-05 21:12:00', '00002', '107.54.12.87');

